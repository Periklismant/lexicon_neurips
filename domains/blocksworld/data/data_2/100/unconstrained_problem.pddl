(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 black_block_1 black_block_2 green_block_2 purple_block_1 - block
 )
 (:init (ontable green_block_1) (on black_block_1 green_block_1) (ontable black_block_2) (on green_block_2 black_block_2) (ontable purple_block_1) (clear black_block_1) (clear green_block_2) (clear purple_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable black_block_1)))
 (:metric minimize (total-cost))
)
