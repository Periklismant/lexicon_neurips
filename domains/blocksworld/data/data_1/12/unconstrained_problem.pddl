(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 grey_block_1 black_block_1 yellow_block_2 purple_block_1 purple_block_2 brown_block_1 - block
 )
 (:init (ontable yellow_block_1) (ontable grey_block_1) (on black_block_1 grey_block_1) (on yellow_block_2 yellow_block_1) (on purple_block_1 yellow_block_2) (ontable purple_block_2) (on brown_block_1 black_block_1) (clear purple_block_1) (clear purple_block_2) (clear brown_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding yellow_block_2)))
 (:metric minimize (total-cost))
)
