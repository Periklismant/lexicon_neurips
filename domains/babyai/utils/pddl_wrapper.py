from collections import defaultdict
from enum import IntEnum
from typing import Optional, Tuple, List, Set, Dict

import numpy as np
from dotmap import DotMap
from gymnasium import spaces
from gymnasium.core import ObservationWrapper
from minigrid.core.constants import OBJECT_TO_IDX
from minigrid.minigrid_env import Grid
from utils.utils import Door, Object, Action, EmptyObject, Room, InfeasiblePlan


class CustomActions(IntEnum):
    # Turn left, turn right, move forward
    left = 0
    right = 1
    forward = 2
    # Pick up an object
    pickup = 3
    # Drop an object
    drop = 4
    # Toggle/activate an object
    toggle = 5
    # Done completing task
    done = 6
    # Goto
    goto = 7
    # unblock
    unblock = 8


def in_vicinity(curr_pos: Tuple, goal_pos: Tuple):
    del_x_list = [0, 0, 1, -1]
    del_y_list = [1, -1, 0, 0]
    for del_x, del_y in zip(del_x_list, del_y_list):
        new_x = curr_pos[0] + del_x
        new_y = curr_pos[1] + del_y
        if (new_x, new_y) == goal_pos:
            return True
    return False


def next_cells(curr_pos: Tuple, grid: Grid, visited: Set[Tuple]) -> Tuple:
    width, height = grid.width, grid.height
    del_x_list = [0, 0, 1, -1]
    del_y_list = [1, -1, 0, 0]
    for del_x, del_y in zip(del_x_list, del_y_list):
        new_x = curr_pos[0] + del_x
        new_y = curr_pos[1] + del_y
        if 0 <= new_x < width and 0 <= new_y < height and (new_x, new_y) not in visited:
            yield new_x, new_y


def get_shortest_path(curr_pos: Tuple, target_pos: Tuple, grid: Grid) -> Optional[List[Tuple]]:
    """
    shortest path using BFS
    """
    # width, height = grid.shape
    queue = [curr_pos]
    parent = {curr_pos: None}
    visited = set()
    visited.add(curr_pos)
    while len(queue) > 0:
        pos = queue.pop(0)
        for next_x, next_y in next_cells(pos, grid, visited):
            obj = grid.get(next_x, next_y)
            if (next_x, next_y) == target_pos:
                parent[(next_x, next_y)] = pos
                visited.add((next_x, next_y))
                break
            if obj is None or (obj.type == "door" and obj.is_open):  # free space or open door
                queue.append((next_x, next_y))
                parent[(next_x, next_y)] = pos
                visited.add((next_x, next_y))

    ret_path = []
    if target_pos not in visited:
        return None
    # reconstruct the path
    pos = parent[target_pos]
    while pos is not None:
        ret_path.append(pos)
        pos = parent[pos]
    return ret_path[::-1][1:]


def navigate(curr_pos: Tuple, curr_dir: int, path: List[Tuple]) -> List[int]:
    """
    plan agent actions to navigate from curr_pos following path
    dir >: 0, v: 1, <: 2, ^: 3
    """
    actions = []
    rel_dir_map = {(1, 0): 0, (0, 1): 1, (-1, 0): 2, (0, -1): 3}
    cur_pos = curr_pos
    cur_dir = curr_dir
    for path_cell in path:
        if cur_pos == path_cell:
            break
        del_x, del_y = path_cell[0] - cur_pos[0], path_cell[1] - cur_pos[1]
        rel_dir = rel_dir_map[(del_x, del_y)]
        # if cur_dir == rel_dir:
        if cur_dir - rel_dir in [-1, 3]:  # rotate clockwise/right
            actions.append(1)
        elif cur_dir - rel_dir in [1, -3]:  # rotate anticlockwise/left
            actions.append(0)
        elif abs(cur_dir - rel_dir) == 2:
            [actions.append(1) for _ in range(2)]
        cur_dir = rel_dir
        actions.append(2)
        cur_pos = path_cell
    return actions[:-1]


def bfs(grid, start: Tuple, visited: Set[Tuple]) -> List[Tuple]:
    queue = [start]
    room = set()
    while queue:
        (x, y, o) = queue.pop(0)
        if o is None or o.type not in ["wall", "door"]:
            visited.add((x, y))
            room.add((x, y))
            if x > 0 and (x - 1, y) not in visited:
                queue.append((x - 1, y, grid.get(x - 1, y)))
            if x < grid.width - 1 and (x + 1, y) not in visited:
                queue.append((x + 1, y, grid.get(x + 1, y)))
            if y > 0 and (x, y - 1) not in visited:
                queue.append((x, y - 1, grid.get(x, y - 1)))
            if y < grid.height - 1 and (x, y + 1) not in visited:
                queue.append((x, y + 1, grid.get(x, y + 1)))
    return list(room)


def get_rooms(grid: Grid) -> List[List[Tuple]]:
    rooms = []  # list of tuples, each tuple is (x, y)
    visited = set()
    for i in range(grid.width):
        for j in range(grid.height):
            cell = grid.get(i, j)
            if cell is None or cell.type not in ["wall", "door"]:
                if (i, j) not in visited:
                    room = bfs(grid, (i, j, cell), visited)
                    rooms.append(room)
    return rooms


def get_agent_room(agent_pos: Tuple, rooms: List[List[Tuple]]) -> int:
    """return room id of the agent"""
    for room_ind, room in enumerate(rooms):
        if agent_pos in room:
            return room_ind + 1


def get_adjoining_rooms(door_pos: Tuple, rooms: List[List[Tuple]]) -> List:
    """
    get adjoining rooms given door pos (x, y)
    """
    x, y = door_pos
    adjoining_room_ids = []
    for del_x, del_y in zip([0, 1, -1, 0], [1, 0, 0, -1]):
        new_x, new_y = x + del_x, y + del_y
        for ind, room in enumerate(rooms):
            if (new_x, new_y) in room:
                adjoining_room_ids.append(ind + 1)
                if len(adjoining_room_ids) == 2:
                    return adjoining_room_ids


def get_object_pos(target_object: Object, grid: Grid, rooms: List[List[Tuple]]) -> Optional[Tuple]:
    """
    get object position in the same room as the agent
    """
    #  if target_object is not None(not an empty cell)
    target_color, target_type, target_room = (
        target_object.color,
        target_object.type,
        target_object.room,
    )
    for i in range(grid.width):
        for j in range(grid.height):
            # Get the object at the current position
            cell = grid.get(i, j)
            # If the cell is not None and the object matches the target color and type
            if cell and cell.color == target_color and cell.type == target_type:
                if (i, j) in rooms[target_object.room - 1]:
                    return i, j
    return None


def get_door_pos(door_object: Door, grid: Grid, rooms: List[List[Tuple]]) -> Tuple:
    """
    goto door action
    """
    door_color, door_adj_rooms = door_object.color, door_object.adj_rooms
    room1, room2 = door_adj_rooms
    for i in range(grid.width):
        for j in range(grid.height):
            # Get the object at the current position
            cell = grid.get(i, j)
            if cell is not None and cell.type == "door" and cell.color == door_color:
                adj_rooms = get_adjoining_rooms((i, j), rooms)
                if [room1, room2] == adj_rooms or [room2, room1] == adj_rooms:
                    return i, j


def get_object_of_type(obj_type: str, grid: Grid) -> List:
    objects = []  # list of tuples, each tuple is (x, y, object of type obj_type)
    for i in range(grid.width):
        for j in range(grid.height):
            obj = grid.get(i, j)
            if obj is not None and obj.type == obj_type:
                objects.append((i, j, obj))
    return objects


def get_all_empty_positions(target_room: List[Tuple], fwd_pos: Tuple, grid: Grid) -> List[Tuple]:
    empty_positions = []
    # retrieve all empty positions in target_room
    for i, j in target_room:
        cell = grid.get(i, j)
        # empty cell which is not adjacent to the cell the object was picked from
        if cell is None and [i, j] != list(fwd_pos):
            # if cell is not right next to a door:
            door_flag = False
            for i_del, j_del in zip([0, 0, 1, -1], [1, -1, 0, 0]):
                i_next, j_next = i + i_del, j + j_del
                next_cell = grid.get(i_next, j_next)
                if next_cell is not None and next_cell.type == "door":
                    door_flag = True
            if not door_flag:
                empty_positions.append((i, j))
    return empty_positions


class PDDLObsWrapper(ObservationWrapper):
    """
    Fully observable grid with a language state representation.
    Example:
        >>> import gymnasium as gym
        >>> from minigrid.wrappers import SymbolicObsWrapper
        >>> env = gym.make("BabyAI-GoToRedBlueBall-v0")
        >>> env_obs = PDDLObsWrapper(env)
        >>> obs, _ = env_obs.reset()
        >>> obs['image'].shape
        (11, 11, 3)
    """

    def __init__(self, env):
        # env = FullyObsWrapper(env)
        super().__init__(env)

        self.goal = None
        self.prev_obs = None
        self.actions = CustomActions
        new_image_space = spaces.Box(
            low=0,
            high=max(OBJECT_TO_IDX.values()),
            shape=(self.env.unwrapped.width, self.env.unwrapped.height, 3),  # number of cells
            dtype="uint8",
        )
        self.observation_space = spaces.Dict(
            {**self.observation_space.spaces, "image": new_image_space}
        )

    def map_compiledpddl2simulator(self, action) -> Tuple:
        action_mapper = {
            "gotodoor": self.actions.goto,
            "gotoroom": self.actions.goto,
            "gotoobject": self.actions.goto,
            "gotoempty": self.actions.goto,
            "pick": self.actions.pickup,
            "drop": self.actions.drop,
            "toggle": self.actions.toggle,
            "togglematch": self.actions.toggle,
            "toggleunmatch": self.actions.toggle,
            "unblock": self.actions.unblock,
        }

        action_name = action.action.name.split("_")[0].lower()
        action_args = action.action.name.split("_")[1:]

        mapped_action = action_mapper[action_name]
        if action_name in ["gotoobject", "pick", "drop"]:
            color, type = action_args[0], action_args[1]
            # obj, room_str = action_args.split(" ")
            room = int(action_args[-1])
            target = Object(color=color, type=type, room=room)
        elif action_name in ["gotoempty", "toggle", "togglematch", "toggleunmatch"]:
            target = None
        elif action_name == "gotodoor":
            # door, room1_str, room2_str = action_args.split(" ")
            # color, _, _ = door.split("_")
            color = action_args[0]
            room1 = int(action_args[-3])
            room2 = int(action_args[-1])
            target = Door(color=color, adj_rooms=(room1, room2))
        elif action_name == "gotoroom":
            # room1_str, room2_str, door_str = action_args.split(" ")
            room2 = int(action_args[3])
            target = Room(room_id=room2)
        elif action_name == "unblock":
            # door, obj, room_str = action_args.split(" ")
            color = action_args[3]
            type = action_args[4]
            # color, type, _ = obj.split("_")
            room = int(action_args[-1])
            target = Object(color=color, type=type, room=room)
        else:
            raise Exception(f"{action_name} is not an action name")

        return [mapped_action, target]

    def map_pddl2simulator(self, action) -> Tuple:
        action_mapper = {
            "gotodoor": self.actions.goto,
            "gotoroom": self.actions.goto,
            "gotoobject": self.actions.goto,
            "gotoempty": self.actions.goto,
            "pick": self.actions.pickup,
            "drop": self.actions.drop,
            "toggle": self.actions.toggle,
            "togglematch": self.actions.toggle,
            "toggleunmatch": self.actions.toggle,
            "unblock": self.actions.unblock,
        }

        action_name = action.action.name.lower()
        action_args = " ".join(str(param) for param in action.actual_parameters)

        mapped_action = action_mapper[action_name]
        if action_name in ["gotoobject", "pick", "drop"]:
            obj, room_str = action_args.split(" ")
            color, type, _ = obj.split("_")
            room = int(room_str.split("_")[1])
            target = Object(color=color, type=type, room=room)
        elif action_name in ["gotoempty", "toggle", "togglematch", "toggleunmatch"]:
            target = None
        elif action_name == "gotodoor":
            door, room1_str, room2_str = action_args.split(" ")
            color, _, _ = door.split("_")
            room1 = int(room1_str.split("_")[1])
            room2 = int(room2_str.split("_")[1])
            target = Door(color=color, adj_rooms=(room1, room2))
        elif action_name == "gotoroom":
            room1_str, room2_str, door_str = action_args.split(" ")
            room2 = int(room2_str.split("_")[1])
            target = Room(room_id=room2)
        else:
            door, obj, room_str = action_args.split(" ")
            color, type, _ = obj.split("_")
            room = int(room_str.split("_")[1])
            target = Object(color=color, type=type, room=room)

        return [mapped_action, target]

    def map_plan2simulator(self, plan: List[Action]) -> List:
        simulator_plan = []
        for action in plan:
            simulator_plan.append(self.map_pddl2simulator(action))
        return simulator_plan

    def step(self, action):
        action, target_object = action
        self.env.unwrapped.step_count += 1

        # Get the position in front of the agent
        fwd_pos = self.env.unwrapped.front_pos
        # Get the contents of the cell in front of the agent
        fwd_cell = self.env.unwrapped.grid.get(*fwd_pos)
        agent_pos = self.env.unwrapped.agent_pos
        agent_dir = self.env.unwrapped.agent_dir

        rooms = get_rooms(self.env.unwrapped.grid)

        # Rotate left
        if action == self.actions.left:
            self.env.unwrapped.agent_dir -= 1
            if self.env.unwrapped.agent_dir < 0:
                self.env.unwrapped.agent_dir += 4

        # Rotate right
        elif action == self.actions.right:
            self.env.unwrapped.agent_dir = (self.env.unwrapped.agent_dir + 1) % 4

        # Move forward
        elif action == self.actions.forward:
            if fwd_cell is None or fwd_cell.can_overlap():
                self.env.unwrapped.agent_pos = tuple(fwd_pos)

        # Pick up an object
        elif action == self.actions.pickup:
            if fwd_cell is not None and fwd_cell.can_pickup():
                if self.env.unwrapped.carrying is None:
                    self.env.unwrapped.carrying = fwd_cell
                    self.env.unwrapped.carrying.cur_pos = np.array([-1, -1])
                    self.env.unwrapped.grid.set(fwd_pos[0], fwd_pos[1], None)
                    # state_change = f'picked {fwd_cell.color} {fwd_cell.type}'

        # Drop an object
        elif action == self.actions.drop:
            if fwd_cell is None and self.env.unwrapped.carrying is not None:
                self.env.unwrapped.grid.set(fwd_pos[0], fwd_pos[1], self.env.unwrapped.carrying)
                self.env.unwrapped.carrying.cur_pos = fwd_pos
                # state_change = f'dropped {self.env.unwrapped.carrying.color} {self.env.unwrapped.carrying.type}'
                self.env.unwrapped.carrying = None

        # Toggle door
        elif action == self.actions.toggle:
            if fwd_cell:
                fwd_cell.toggle(self, fwd_pos)

        elif action == self.actions.unblock:
            if not fwd_cell or self.env.unwrapped.carrying is not None:
                raise InfeasiblePlan("Action is infeasible.")
            else:
                self.step((3, fwd_cell))
            # 2. goto an empty location
            self.step((7, None))
            # 3. drop the object in empty location
            self.step((4, None))

        elif action == self.actions.goto:
            # Case 1: goto empty (same, different rooms)
            if target_object is None or isinstance(target_object, Room):
                # find empty positions in the same rooms
                if target_object is None:
                    target_room = get_agent_room(agent_pos, rooms)  # empty pos in agent room
                else:
                    target_room = target_object.room_id  # empty pos in different room
                empty_positions = get_all_empty_positions(
                    grid=self.env.unwrapped.grid,
                    target_room=rooms[target_room - 1],
                    fwd_pos=fwd_pos,
                )
                tar_obj_str = "agent's room" if target_object is None else "target room"
                if len(empty_positions) == 0:
                    raise InfeasiblePlan(f"No empty positions in {tar_obj_str}.")

                for empty_ind, empty_pos in enumerate(empty_positions):
                    # find shortest path from agent pos to empty pos
                    shortest_path = get_shortest_path(
                        curr_pos=agent_pos, target_pos=empty_pos, grid=self.env.unwrapped.grid
                    )
                    try:
                        # chart a course from agent pos to target pos
                        shortest_path_copy = shortest_path.copy()
                        shortest_path_copy.append(empty_pos)
                        nav_actions = navigate(agent_pos, agent_dir, shortest_path_copy)
                        while len(nav_actions) != 0:
                            step_action = nav_actions.pop(0)
                            # _, reward, terminated, _, _ = self.step((step_action, None))
                            self.step((step_action, None))
                        break
                    except AttributeError:
                        # target position blocked
                        # print('Target unreachable')
                        if empty_ind == len(empty_positions) - 1:
                            raise InfeasiblePlan(
                                f"All empty position in the {tar_obj_str} are unreachable."
                            )
                        else:
                            continue

            # Case 2: goto object in the same room / goto door
            elif isinstance(target_object, Object) or isinstance(target_object, Door):
                if isinstance(target_object, Object):
                    target_pos = get_object_pos(target_object, self.env.unwrapped.grid, rooms)
                else:
                    target_pos = get_door_pos(target_object, self.env.unwrapped.grid, rooms)
                tar_obj_str = "Object" if isinstance(target_object, Object) else "Door"
                if target_pos is None:
                    raise InfeasiblePlan(
                        f"{tar_obj_str} is inaccessible."
                    )  # object in a different room
                else:
                    shortest_path = get_shortest_path(
                        curr_pos=agent_pos, target_pos=target_pos, grid=self.env.unwrapped.grid
                    )
                    try:
                        # chart a course from agent pos to target pos
                        shortest_path.append(target_pos)
                        nav_actions = navigate(agent_pos, agent_dir, shortest_path)
                        while len(nav_actions) != 0:
                            step_action = nav_actions.pop(0)
                            # _, reward, terminated, _, _ = self.step((step_action, None))
                            self.step((step_action, None))
                    except AttributeError:
                        # target position blocked
                        # print('Target unreachable')
                        raise InfeasiblePlan(f"{tar_obj_str} position is blocked.")

            else:
                raise NotImplementedError

        # Done action (not used by default)
        elif action == self.actions.done:
            pass

        # if self.env.unwrapped.step_count >= self.env.unwrapped.max_steps:
        #     truncated = True

        if self.render_mode == "human":
            self.render()

        obs = self.observation(self.env.unwrapped.gen_obs())
        # reward, terminated, truncated = self.verify_rl_goal(rooms)
        return obs  # , reward, terminated, truncated, None

    """
    def verify_rl_goal(self, rooms: List[List[Tuple]]) -> Tuple[float, bool, bool]:
        terminated = False
        truncated = False
        reward = 0
        agent_pos = self.env.unwrapped.agent_pos
        if self.goal.task == "goto":
            if self.goal.source_room is None:  # goto any
                fwd_pos = self.env.unwrapped.front_pos
                fwd_cell = self.env.unwrapped.grid.get(*fwd_pos)
                if fwd_cell is not None:
                    if fwd_cell.color == self.goal.color and fwd_cell.type == self.goal.type:
                        terminated = True
                        reward = 1
            else:
                goal_room = int(self.goal.source_room.split("_")[1])
                # if agent location in goal room
                if agent_pos in rooms[goal_room - 1]:
                    fwd_pos = self.env.unwrapped.front_pos
                    fwd_cell = self.env.unwrapped.grid.get(*fwd_pos)
                    if fwd_cell is not None:
                        if fwd_cell.color == self.goal.color and fwd_cell.type == self.goal.type:
                            terminated = True
                            reward = 1
        elif self.goal.task == "put":
            goal_room = int(self.goal.dest_room.split("_")[1])
            # if agent and object location in goal room
            target_object = Object(color=self.goal.color, type=self.goal.type, room=goal_room)
            target_pos = get_object_pos(target_object, self.env.unwrapped.grid, rooms)
            if agent_pos in rooms[goal_room - 1] and target_pos is not None:
                terminated = True
                reward = 1
        elif self.goal.task == "pickup":
            carrying_obj = self.env.unwrapped.carrying
            if (
                carrying_obj is not None
                and carrying_obj.color == self.goal.color
                and carrying_obj.type == self.goal.type
            ):
                if self.goal.source_room is None:  # pickup_any
                    terminated = True
                    reward = 1
                else:  # pickup specific
                    goal_room = int(self.goal.source_room.split("_")[1])
                    # if agent location in goal room
                    if agent_pos in rooms[goal_room - 1]:
                        terminated = True
                        reward = 1
        elif self.goal.task == "open":
            if self.goal.between_rooms is None:  # unlock any
                all_doors = get_object_of_type("door", self.env.unwrapped.grid)
                for i, j, door in all_doors:
                    if door.color == self.goal.color and door.is_open:
                        terminated = True
                        reward = 1
            else:  # unlock specific
                room1_str, room2_str = self.goal.between_rooms
                adj_rooms = (int(room1_str.split("_")[1]), int(room2_str.split("_")[1]))
                target_door = Door(color=self.goal.color, adj_rooms=adj_rooms)
                target_door_pos = get_door_pos(target_door, self.env.unwrapped.grid, rooms)
                target_door_obj = self.env.unwrapped.grid.get(*target_door_pos)
                if target_door_obj.is_open:
                    terminated = True
                    reward = 1
        else:
            raise NotImplementedError
        return reward, terminated, truncated
    """

    def observation(self, obs: Dict):
        # objects: List[str], doors: List[str], rooms: List[str], otypes: List[str], agent_room: str,
        # object_in_rooms: List[Tuple[str,str]], carrying: str, all_adjacent_rooms: List[Tuple[str, str, str]],
        # locked_doors: List[str], blocked: List[Tuple[str, str]], object_types: List[Tuple[str, str]]
        # agent_at: str, object_colors: List[Tuple[str, str]]

        # retrieve the rooms positions using BFS
        rooms = get_rooms(self.env.unwrapped.grid)
        map2id_rooms = {ind: f"room_{ind}" for ind in range(1, len(rooms) + 1)}
        fwd_pos = self.env.unwrapped.front_pos

        if self.prev_obs is None:
            # TODO: can the agent be carrying something at the start of episode?
            obs = {
                "nl_grid_description": "",
                "carrying": None,
                "agent_at": None,
                "blocked": [],
                "object_pos_tuples": [],
                "otypes": ["KeyType", "BallType", "BoxType", "EmptyType"],
                "ctypes": [
                    "RedType",
                    "GreenType",
                    "BlueType",
                    "YellowType",
                    "PurpleType",
                    "GreyType",
                ],
                "objects": ["empty"],
                "rooms": [],
                "visited": [],
                "object_in_rooms": [],
                "object_types": [],
                "object_colors": [],
                "doors": [],
                "locked_doors": [],
                "all_adjacent_rooms": [],
            }
            counter_objects = defaultdict()
            for i, room in enumerate(rooms):
                room_id = map2id_rooms[i + 1]
                obs["rooms"].append(room_id)
                for x, y in room:
                    obj_in_cell = self.env.unwrapped.grid.get(x, y)
                    if obj_in_cell is None:
                        obj_in_cell = EmptyObject(cur_pos=(x, y))
                        obs["object_types"].append(("empty", "EmptyType"))
                    if obj_in_cell.type in ["key", "box", "ball"]:
                        obj_name = f"{obj_in_cell.color}_{obj_in_cell.type}"
                        if obj_name in counter_objects.keys():
                            counter_objects[obj_name] += 1
                        else:
                            counter_objects[obj_name] = 1
                        # assign an unique id to each object
                        obj_id = f"{obj_name}_{counter_objects[obj_name]}"
                        obs["objects"].append(obj_id)
                        obs["object_types"].append((obj_id, obj_in_cell.type.capitalize() + "Type"))
                        obs["object_colors"].append(
                            (obj_id, obj_in_cell.color.capitalize() + "Type")
                        )
                        obs["object_in_rooms"].append((obj_id, room_id))
                        obs["object_pos_tuples"].append(
                            DotMap(
                                type=obj_in_cell.type,
                                color=obj_in_cell.color,
                                pos=obj_in_cell.cur_pos,
                                room_id=room_id,
                                unique_id=obj_id,
                                dir=None,
                            )
                        )
                        assert x == obj_in_cell.cur_pos[0] and y == obj_in_cell.cur_pos[1]
                        # room_desc_nl += f'{obj_id}, '
                        if fwd_pos[0] == x and fwd_pos[1] == y:
                            obs["agent_at"] = obj_id
                            # agent_at_nl = f'agent is facing {obj_id}. '
                    if [x, y] == list(self.env.unwrapped.agent_pos):
                        obs["agent_room"] = room_id
                        obs["visited"] = [room_id]
                        obs["object_pos_tuples"].append(
                            DotMap(
                                type="agent",
                                color=None,
                                pos=(x, y),
                                unique_id=None,
                                room_id=room_id,
                                dir=self.env.unwrapped.agent_dir,
                            )
                        )
                #         room_desc_nl += f'({x, y}): agent, '
                # obs["nl_grid_description"] += room_desc_nl
                # if agent_at_nl is not None:
                #     obs["nl_grid_description"] += agent_at_nl
                # room_desc_nl[-2] = '.'
            # elif obj_in_cell.type == 'door':
            doors = get_object_of_type("door", self.env.unwrapped.grid)
            for i, door in enumerate(doors):
                x, y, door_obj = door
                door_name = f"{door_obj.color}_door"
                if door_name in counter_objects:
                    counter_objects[door_name] += 1
                else:
                    counter_objects[door_name] = 1
                door_id = f"{door_name}_{counter_objects[door_name]}"
                obs["doors"].append(door_id)
                obs["object_colors"].append((door_id, f"{door_obj.color.capitalize()}Type"))
                obs["object_pos_tuples"].append(
                    DotMap(
                        type=door_obj.type,
                        color=door_obj.color,
                        room_id=None,
                        pos=door_obj.cur_pos,
                        unique_id=door_id,
                        dir=None,
                    )
                )
                if not door_obj.is_open:
                    obs["locked_doors"].append(door_id)
                # adjoining rooms for the door object
                adj_room_ids = get_adjoining_rooms((x, y), rooms)
                room_id_1, room_id_2 = map2id_rooms[adj_room_ids[0]], map2id_rooms[adj_room_ids[1]]
                obs["all_adjacent_rooms"].append((room_id_1, room_id_2, door_id))
                obs["all_adjacent_rooms"].append(
                    (room_id_2, room_id_1, door_id)
                )  # symmetric relation
                if fwd_pos[0] == x and fwd_pos[1] == y:
                    obs["agent_at"] = door_id
                # obs["nl_grid_description"] += f'{door_id} connects rooms {room_id_1} and {room_id_2}. '
                # if not door_obj.is_open:
                #     obs["nl_grid_description"] += f'{door_id} is unlocked.'
            obs["object_types"] = list(set(obs["object_types"]))

        else:
            obs = self.prev_obs.copy()
            obs["nl_grid_description"] = ""
            obs["carrying"] = None
            obs["agent_at"] = None
            obs["blocked"] = []
            obs["object_pos_tuples"] = []
            obs["object_in_rooms"] = []
            obs["locked_doors"] = []
            # obs["visited"]
            for i, room in enumerate(rooms):
                room_id = map2id_rooms[i + 1]
                for x, y in room:
                    obj_in_cell = self.env.unwrapped.grid.get(x, y)
                    if [x, y] == list(self.env.unwrapped.agent_pos):
                        obs["agent_room"] = room_id
                        if room_id not in obs["visited"]:
                            obs["visited"] += [room_id]  # append to visited from prev obs
                        obs["object_pos_tuples"].append(
                            DotMap(
                                type="agent",
                                color=None,
                                pos=(x, y),
                                unique_id=None,
                                room_id=room_id,
                                dir=self.env.unwrapped.agent_dir,
                            )
                        )
                    elif obj_in_cell is None:
                        continue
                    elif obj_in_cell.type in ["key", "box", "ball"]:
                        obj_unique_id = self.find_unique_id_from_prev(
                            target_pos=(x, y),
                            target_color=obj_in_cell.color,
                            target_type=obj_in_cell.type,
                        )
                        obs["object_pos_tuples"].append(
                            DotMap(
                                type=obj_in_cell.type,
                                color=obj_in_cell.color,
                                pos=obj_in_cell.cur_pos,
                                unique_id=obj_unique_id,
                                room_id=room_id,
                                dir=None,
                            )
                        )
                        obs["object_in_rooms"].append((obj_unique_id, room_id))
                        if fwd_pos[0] == x and fwd_pos[1] == y:
                            obs["agent_at"] = obj_unique_id

            doors = get_object_of_type("door", self.env.unwrapped.grid)
            for i, door in enumerate(doors):
                x, y, door_obj = door
                door_unique_id = self.find_unique_id_from_prev(
                    target_pos=(x, y), target_color=door_obj.color, target_type=door_obj.type
                )
                obs["object_pos_tuples"].append(
                    DotMap(
                        type=door_obj.type,
                        color=door_obj.color,
                        room_id=None,
                        pos=door_obj.cur_pos,
                        unique_id=door_unique_id,
                        dir=None,
                    )
                )
                if not door_obj.is_open:
                    obs["locked_doors"].append(door_unique_id)
                if fwd_pos[0] == x and fwd_pos[1] == y:
                    obs["agent_at"] = door_unique_id

            if self.env.unwrapped.carrying is not None:
                carrying_obj = self.env.unwrapped.carrying
                # still carrying
                if self.prev_obs["carrying"] is not None:
                    obj_id = self.prev_obs["carrying"]
                else:  # else picked
                    # try:
                    # Find the key-value pair that is missing from dotmap1
                    for item in self.prev_obs["object_pos_tuples"]:
                        if not any(
                            item.type == obj.type
                            and item.color == obj.color
                            and item.unique_id == obj.unique_id
                            for obj in obs["object_pos_tuples"]
                        ):
                            # if item not in obs["object_pos_tuples"]:
                            obj = item
                            break
                    # obj = [item for item in self.prev_obs["object_pos_tuples"]
                    #        if item not in obs["object_pos_tuples"]][0]
                    assert carrying_obj.color == obj.color
                    assert carrying_obj.type == obj.type
                    # except:
                    #     print('hi ')
                    obj_id = obj.unique_id
                obs["carrying"] = obj_id

        self.prev_obs = obs.copy()
        # get a natural language representation of the observation
        self.map_obs2text(obs, rooms, map2id_rooms)
        return obs

    def find_unique_id_from_prev(
        self, target_pos: Tuple[int, int], target_color: str, target_type: str
    ) -> str:
        for obj_pos_tuple in self.prev_obs["object_pos_tuples"]:
            if list(target_pos) == list(obj_pos_tuple.pos):
                assert target_color == obj_pos_tuple.color
                assert target_type == obj_pos_tuple.type
                return obj_pos_tuple.unique_id

        # else, a new object has appeared -> drop action must have been performed
        # return carrying_object from prev state
        carrying_prev_state = self.prev_obs["carrying"]
        color, type, _ = carrying_prev_state.split("_")
        assert target_color == color
        assert target_type == type
        return self.prev_obs["carrying"]

    def map_obs2text(self, obs, rooms, map2id_rooms):
        room_text = {k: [] for k in obs["rooms"]}
        door_text = ""
        for obj in obs["object_pos_tuples"]:
            if obj.room_id is not None:
                if obj.type == "agent":
                    obj_str = f"{obj.pos}: agent"
                else:
                    obj_str = f"{obj.pos}: {obj.unique_id}"
                room_text[obj.room_id].append(obj_str)
            else:  # door
                adj_room_ids = get_adjoining_rooms(obj.pos, rooms)
                room_id_1, room_id_2 = map2id_rooms[adj_room_ids[0]], map2id_rooms[adj_room_ids[1]]
                door_text += f" {obj.unique_id} connects {room_id_1} and {room_id_2}."
                if obj.unique_id in obs["locked_doors"]:
                    door_text += f" {obj.unique_id} is locked."
                else:
                    door_text += f" {obj.unique_id} is unlocked."

        for k, v in room_text.items():
            combined_obj_str = ", ".join(list(v)) + "."
            obs["nl_grid_description"] += f" {k}: {combined_obj_str}"

        if obs["carrying"] is not None:
            obs["nl_grid_description"] += f' agent is carrying {obs["carrying"]}.'
        if obs["agent_at"] is not None:
            obs["nl_grid_description"] += f' agent is facing {obs["agent_at"]}.'

        obs["nl_grid_description"] += door_text

        visited_rooms_str = ", ".join(obs["visited"])
        obs["nl_grid_description"] += f" agent has visited {visited_rooms_str}."
