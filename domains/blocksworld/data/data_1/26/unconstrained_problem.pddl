(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   blue_block_1 red_block_1 green_block_1 blue_block_2 white_block_1 purple_block_1 green_block_2 - block
 )
 (:init (ontable blue_block_1) (on red_block_1 blue_block_1) (ontable green_block_1) (on blue_block_2 green_block_1) (on white_block_1 blue_block_2) (on purple_block_1 white_block_1) (ontable green_block_2) (clear red_block_1) (clear purple_block_1) (clear green_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (clear white_block_1)))
 (:metric minimize (total-cost))
)
