(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   grey_block_1 grey_block_2 white_block_1 blue_block_1 purple_block_1 orange_block_1 red_block_1 - block
 )
 (:init (ontable grey_block_1) (ontable grey_block_2) (on white_block_1 grey_block_1) (on blue_block_1 white_block_1) (on purple_block_1 blue_block_1) (ontable orange_block_1) (on red_block_1 grey_block_2) (clear purple_block_1) (clear orange_block_1) (clear red_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on orange_block_1 blue_block_1)))
 (:metric minimize (total-cost))
)
