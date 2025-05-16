(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 purple_block_1 white_block_1 black_block_1 grey_block_1 blue_block_1 blue_block_2 - block
 )
 (:init (ontable yellow_block_1) (on purple_block_1 yellow_block_1) (ontable white_block_1) (on black_block_1 white_block_1) (ontable grey_block_1) (on blue_block_1 black_block_1) (ontable blue_block_2) (clear purple_block_1) (clear grey_block_1) (clear blue_block_1) (clear blue_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding grey_block_1)))
 (:metric minimize (total-cost))
)
