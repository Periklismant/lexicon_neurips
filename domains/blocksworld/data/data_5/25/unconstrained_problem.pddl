(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   purple_block_1 black_block_1 purple_block_2 grey_block_1 brown_block_1 brown_block_2 grey_block_2 - block
 )
 (:init (ontable purple_block_1) (ontable black_block_1) (on purple_block_2 black_block_1) (on grey_block_1 purple_block_1) (on brown_block_1 grey_block_1) (on brown_block_2 brown_block_1) (on grey_block_2 brown_block_2) (clear purple_block_2) (clear grey_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (clear black_block_1)))
 (:metric minimize (total-cost))
)
