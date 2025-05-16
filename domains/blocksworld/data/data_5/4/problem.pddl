(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 blue_block_1 purple_block_1 orange_block_1 purple_block_2 yellow_block_1 blue_block_2 - block
 )
 (:init (ontable green_block_1) (ontable blue_block_1) (ontable purple_block_1) (on orange_block_1 green_block_1) (on purple_block_2 purple_block_1) (on yellow_block_1 blue_block_1) (ontable blue_block_2) (clear orange_block_1) (clear purple_block_2) (clear yellow_block_1) (clear blue_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on purple_block_1 yellow_block_1)))
 (:constraints (sometime (or (not (ontable blue_block_1)) (on blue_block_2 orange_block_1))) (always (not (ontable purple_block_2))) (sometime (and (clear green_block_1) (holding blue_block_2))) (sometime (holding purple_block_2)) (sometime-before (holding purple_block_2) (and (on blue_block_2 orange_block_1) (not (ontable blue_block_1)))) (sometime (not (clear purple_block_2))) (sometime-before (not (clear purple_block_2)) (or (on yellow_block_1 orange_block_1) (on purple_block_2 blue_block_1))))
 (:metric minimize (total-cost))
)
