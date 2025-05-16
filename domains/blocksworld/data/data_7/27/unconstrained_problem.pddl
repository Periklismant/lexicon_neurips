(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 black_block_1 green_block_1 purple_block_1 red_block_1 purple_block_2 black_block_2 - block
 )
 (:init (ontable yellow_block_1) (ontable black_block_1) (on green_block_1 yellow_block_1) (ontable purple_block_1) (on red_block_1 black_block_1) (on purple_block_2 red_block_1) (ontable black_block_2) (clear green_block_1) (clear purple_block_1) (clear purple_block_2) (clear black_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on red_block_1 yellow_block_1)))
 (:metric minimize (total-cost))
)
