(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   orange_block_1 brown_block_1 green_block_1 purple_block_1 red_block_1 grey_block_1 green_block_2 - block
 )
 (:init (ontable orange_block_1) (ontable brown_block_1) (ontable green_block_1) (on purple_block_1 orange_block_1) (on red_block_1 brown_block_1) (on grey_block_1 green_block_1) (ontable green_block_2) (clear purple_block_1) (clear red_block_1) (clear grey_block_1) (clear green_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on green_block_2 orange_block_1)))
 (:metric minimize (total-cost))
)
