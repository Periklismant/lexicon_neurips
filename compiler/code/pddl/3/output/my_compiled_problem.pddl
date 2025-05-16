(define (problem mytrajectoryconstraintsremover_blocksworld_problem-problem)
 (:domain mytrajectoryconstraintsremover_blocksworld_problem-domain)
 (:objects
   green_block_1 blue_block_1 orange_block_1 blue_block_2 black_block_1 black_block_2 black_block_3 - block
 )
 (:init (ontable green_block_1) (ontable brown_block_1) (ontable blue_block_1) (on orange_block_1 blue_block_1) (ontable blue_block_2) (on black_block_1 orange_block_1) (on black_block_2 blue_block_2) (on black_block_3 black_block_2) (clear green_block_1) (clear brown_block_1) (clear black_block_1) (clear black_block_3) (handempty) (= (total-cost) 0))
 (:goal (and (exists (?x - block)
 (and (on blue_block_2 ?x) (on ?x brown_block_1))) (hold_0)))
 (:metric minimize (total-cost))
)
