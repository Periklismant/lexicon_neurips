(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   grey_block_1 white_block_1 purple_block_1 white_block_2 red_block_1 yellow_block_1 blue_block_1 - block
 )
 (:init (ontable grey_block_1) (ontable white_block_1) (on purple_block_1 white_block_1) (on white_block_2 purple_block_1) (ontable red_block_1) (on yellow_block_1 red_block_1) (on blue_block_1 yellow_block_1) (clear grey_block_1) (clear white_block_2) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable yellow_block_1)))
 (:metric minimize (total-cost))
)
