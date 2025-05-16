"""redefining BabyAI functions to customize the grid: uses monkey patching"""

from __future__ import annotations

import math
from typing import Any

import numpy as np

# from minigrid.minigrid_env import MiniGridEnv
from gym.core import Env
from gymnasium.core import ObsType
from minigrid.core.constants import COLOR_NAMES

# from minigrid.core.roomgrid import RoomGrid
from minigrid.core.grid import Grid
from minigrid.core.roomgrid import Room
from minigrid.core.world_object import Ball, Box, Door, Key, WorldObj


# modified connect_all function from minigrid.core.roomgrid.RoomGrid
def connect_all(self, door_colors=COLOR_NAMES, max_itrs: int = 5000):
    """
    Make sure that all rooms are reachable by the agent from its
    starting position
    """

    # start_room = self.room_from_pos(*self.agent_pos)

    # added_doors = []

    """Unused 
    def find_reach():
        reach = set()
        stack = [start_room]
        while len(stack) > 0:
            room = stack.pop()
            if room in reach:
                continue
            reach.add(room)
            for i in range(0, 4):
                if room.doors[i]:
                    stack.append(room.neighbors[i])
        return reach
    """

    # num_itrs = 0

    rooms = list()
    for rooms_row in self.room_grid:
        for room in rooms_row:
            if room.locked:
                raise RecursionError("connect_all failed due to locked room")
            rooms.append(room)

    for i in range(0, self.num_cols):
        for j in range(0, self.num_rows):
            room = self.get_room(i, j)
            for k in range(0, 4):
                if not room.door_pos[k] or room.doors[k]:
                    # print(f"Door already in position {k}")
                    continue
                color = self._rand_elem(door_colors)
                door, _ = self.add_door(i, j, k, color, False)

    # while any(sum(x is not None for x in room.doors) < 2 for room in rooms):
    # used_doors = {door for door in room.doors for room in rooms}
    # unused_doors =
    # for

    """
    while True:
        # This is to handle rare situations where random sampling produces
        # a level that cannot be connected, producing in an infinite loop
        if num_itrs > max_itrs:
            raise RecursionError("connect_all failed")
        num_itrs += 1

        print(f"Iteration: {num_itrs}")

        # If all rooms are reachable, stop
        # reach = find_reach()
        # if len(reach) == self.num_rows * self.num_cols:
        #     break
        done = True
        for room in rooms:
            print(room)
            print(room.doors)
            print()
            if sum(x is not None for x in room.doors) < 2:
                done = False
                # break
        if done:
            break
        # if len(added_doors) == self.num_rows * self.num_cols:
        # break

        # Pick a random room and door position
        #i = self._rand_int(0, self.num_cols)
        #j = self._rand_int(0, self.num_rows)
        #k = self._rand_int(0, 4)
        #room = self.get_room(i, j)

        #print(f"Sampled room: {room}")
        #print(f"Sampled door position: {k}")

        # If there is already a door there, skip
        #if not room.door_pos[k] or room.doors[k]:
            #print(f"Door already in position {k}")
            #continue

        # In the start state of our problems, all doors are locked.
        # Why should we care about locked doors at this stage?
        # neighbor_room = room.neighbors[k]
        # assert neighbor_room is not None
        # if room.locked or neighbor_room.locked:
        #     continue

        #color = self._rand_elem(door_colors)
        #door, _ = self.add_door(i, j, k, color, False)
        # added_doors.append(door)

        # print(f"Added doors: {added_doors}")
        # print(f"Len {len(added_doors)}")
        # print(f"{self.room_grid}")
        for rooms_row in self.room_grid:
         for room in rooms_row:
         print(f"{room}")
         print(f"{room.doors}")
         print()
    """

    return list({x for room in rooms for x in room.doors if x is not None})


# def connect_all_load(self, door_colors=COLOR_NAMES, max_itrs: int = 5000):
#     """used while initializing grid from dataset"""
#     return []


def add_distractors(
    self,
    i: int | None = None,
    j: int | None = None,
    num_distractors: int = 10,
    all_unique: bool = True,
):
    """
    Add random objects that can potentially distract/confuse the agent.
    """
    num_distractors = 8

    # Collect a list of existing objects
    objs = []
    # List of distractors added
    dists = []

    for row_ind, row in enumerate(self.room_grid):
        for col_ind, room in enumerate(row):
            # door_colors = [door.color for door in room.doors if door is not None]
            for obj in room.objs:
                objs.append((obj.type, obj.color))
            # for color in door_colors:
            # obj = ("key", color)
            # dist, pos = self.add_object(col_ind, row_ind, *obj)
            # bjs.append(obj)
            # ists.append(dist)
            # num_distractors -= 1

    while len(dists) < num_distractors:
        color = self._rand_elem(COLOR_NAMES)
        type = self._rand_elem(["ball", "box"])
        obj = (type, color)

        if all_unique and obj in objs:
            continue

        # Add the object to a random room if no room specified
        room_i = i
        room_j = j
        if room_i is None:
            room_i = self._rand_int(0, self.num_cols)
        if room_j is None:
            room_j = self._rand_int(0, self.num_rows)

        dist, pos = self.add_object(room_i, room_j, *obj)

        objs.append(obj)
        dists.append(dist)

    return dists


# def add_distractors_load(self, i: int | None = None, j: int | None = None,
#                          num_distractors: int = 10, all_unique: bool = True, ):
#     """used while initializing grid from dataset"""
#     return []


def adj_pos(pos):
    arr_x = [0, 0, 1, -1]
    arr_y = [-1, 1, 0, 0]

    for del_x, del_y in zip(arr_x, arr_y):
        new_x, new_y = pos[0] + del_x, pos[1] + del_y
        yield new_x, new_y


def blocking_door(pos, doors_pos) -> False:
    for door_pos in doors_pos:
        for adj in adj_pos(door_pos):
            if pos == adj:
                return True
    return False


def place_obj(
    self,
    obj: WorldObj | None,
    top: Point = None,
    size: tuple[int, int] = None,
    reject_fn=None,
    max_tries=math.inf,
):
    """
    Place an object at an empty position in the grid

    :param top: top-left position of the rectangle where to place
    :param size: size of the rectangle where to place
    :param reject_fn: function to filter out potential positions
    """

    if top is None:
        top = (0, 0)
    else:
        top = (max(top[0], 0), max(top[1], 0))

    if size is None:
        size = (self.grid.width, self.grid.height)

    num_tries = 0

    while True:
        # This is to handle with rare cases where rejection sampling
        # gets stuck in an infinite loop
        if num_tries > max_tries:
            raise RecursionError("rejection sampling failed in place_obj")

        num_tries += 1

        pos = (
            self._rand_int(top[0], min(top[0] + size[0], self.grid.width)),
            self._rand_int(top[1], min(top[1] + size[1], self.grid.height)),
        )

        # Don't place the object on top of another object
        if self.grid.get(*pos) is not None:
            continue

        # don't place the object next to a door
        doors_pos = []
        for j, row in enumerate(self.room_grid):
            for i, room in enumerate(row):
                doors_pos.extend(
                    [door.cur_pos for door in room.doors if door is not None]
                )
        doors_pos = list(set(doors_pos))
        if blocking_door(pos, doors_pos):
            continue

        # Don't place the object where the agent is
        if np.array_equal(pos, self.agent_pos):
            continue

        # Check if there is a filtering criterion
        if reject_fn and reject_fn(self, pos):
            continue

        break

    self.grid.set(pos[0], pos[1], obj)

    if obj is not None:
        obj.init_pos = pos
        obj.cur_pos = pos

    return pos


def gen_grid(self, width, height):
    # Create an empty grid
    self.grid = Grid(width, height)
    self.room_grid = []

    # For each row of rooms
    for j in range(0, self.num_rows):
        row = []

        # For each column of rooms
        for i in range(0, self.num_cols):
            room = Room(
                (i * (self.room_size - 1), j * (self.room_size - 1)),
                (self.room_size, self.room_size),
            )
            row.append(room)

            # Generate the walls for this room
            self.grid.wall_rect(*room.top, *room.size)

        self.room_grid.append(row)

    # For each row of rooms
    for j in range(0, self.num_rows):
        # For each column of rooms
        for i in range(0, self.num_cols):
            room = self.room_grid[j][i]

            x_l, y_l = (room.top[0] + 1, room.top[1] + 1)
            x_m, y_m = (
                room.top[0] + room.size[0] - 1,
                room.top[1] + room.size[1] - 1,
            )

            # Door positions, order is right, down, left, up
            if i < self.num_cols - 1:
                room.neighbors[0] = self.room_grid[j][i + 1]
                # room.door_pos[0] = (x_m, self._rand_int(y_l, y_m))
            if j < self.num_rows - 1:
                room.neighbors[1] = self.room_grid[j + 1][i]
                # room.door_pos[1] = (self._rand_int(x_l, x_m), y_m)
            if i > 0:
                room.neighbors[2] = self.room_grid[j][i - 1]
                # room.door_pos[2] = room.neighbors[2].door_pos[0]
            if j > 0:
                room.neighbors[3] = self.room_grid[j - 1][i]
                # room.door_pos[3] = room.neighbors[3].door_pos[1]

    # Place the custom objects
    for obj in self.initial_state:
        obj_type = obj.type
        pos = obj.pos
        # print(pos)
        j = 1 if pos[0] > 3 else 0
        i = 1 if pos[1] > 3 else 0
        # room = self.get_room(i, j)
        if obj_type == "agent":
            self.agent_pos = pos
            self.agent_dir = obj.dir
            # self.grid.set(pos[0], pos[1], obj)
        elif obj_type == "key":
            self.grid.set(pos[0], pos[1], Key(color=obj.color))
            obj = self.grid.get(pos[0], pos[1])
            obj.cur_pos = pos
            obj.init_pos = pos
            self.room_grid[i][j].objs.append(obj)
        elif obj_type == "box":
            self.grid.set(pos[0], pos[1], Box(color=obj.color))
            obj = self.grid.get(pos[0], pos[1])
            obj.cur_pos = pos
            obj.init_pos = pos
            self.room_grid[i][j].objs.append(obj)
        elif obj_type == "ball":
            self.grid.set(pos[0], pos[1], Ball(color=obj.color))
            obj = self.grid.get(pos[0], pos[1])
            obj.cur_pos = pos
            obj.init_pos = pos
            self.room_grid[i][j].objs.append(obj)
        elif obj_type == "door":
            self.grid.set(pos[0], pos[1], Door(color=obj.color, is_open=False))
            obj = self.grid.get(pos[0], pos[1])
            obj.cur_pos = pos
            obj.init_pos = pos
            # room.objs.append(obj)
            # Door positions, order is right, down, left, up
            if i < self.num_cols - 1:
                self.room_grid[j][i].door_pos[0] = pos
            if j < self.num_rows - 1:
                self.room_grid[j][i].door_pos[1] = pos
            if i > 0:
                self.room_grid[j][1].door_pos[2] = pos
            if j > 0:
                self.room_grid[j][1].door_pos[3] = pos

        # Add more object types as needed

    self.mission = None


def reset_via_load(
    self,
    *,
    seed: int | None = None,
    options: dict[str, Any] | None = None,
) -> tuple[ObsType, dict[str, Any]]:
    # super().reset(seed=seed)
    Env.reset(self, seed=seed)

    # Generate a new random grid at the start of each episode
    self._gen_grid(self.width, self.height)
    # Item picked up, being carried, initially nothing
    self.carrying = None
    # Step count since episode start
    self.step_count = 0

    if self.render_mode == "human":
        self.render()
    # Return first observation
    obs = self.gen_obs()

    return obs, {}


def gen_mission(self):
    # Generate random instructions
    self.instrs = self.rand_instr(
        action_kinds=self.action_kinds, instr_kinds=self.instr_kinds
    )


def validate_instrs(self, instr):
    return
