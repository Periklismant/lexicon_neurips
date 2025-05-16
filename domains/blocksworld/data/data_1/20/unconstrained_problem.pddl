(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 white_block_1 purple_block_1 blue_block_1 red_block_1 purple_block_2 purple_block_3 - block
 )
 (:init (ontable green_block_1) (ontable white_block_1) (on purple_block_1 green_block_1) (on blue_block_1 white_block_1) (ontable red_block_1) (on purple_block_2 purple_block_1) (on purple_block_3 red_block_1) (clear blue_block_1) (clear purple_block_2) (clear purple_block_3) (handempty) (= (total-cost) 0))
 (:goal (and (on red_block_1 purple_block_3)))
 (:metric minimize (total-cost))
)
