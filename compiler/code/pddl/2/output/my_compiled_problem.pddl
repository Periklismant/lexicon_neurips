(define (problem mytrajectoryconstraintsremover_blocksworld_problem-problem)
 (:domain mytrajectoryconstraintsremover_blocksworld_problem-domain)
 (:objects
   green_block_1 blue_block_1 - block
 )
 (:init (ontable green_block_1) (on blue_block_1 green_block_1) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:metric minimize (total-cost))
)
