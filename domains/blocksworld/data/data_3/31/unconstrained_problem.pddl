(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 black_block_1 brown_block_1 orange_block_1 green_block_1 black_block_2 yellow_block_1 - block
 )
 (:init (ontable red_block_1) (ontable black_block_1) (on brown_block_1 red_block_1) (on orange_block_1 black_block_1) (on green_block_1 brown_block_1) (on black_block_2 orange_block_1) (ontable yellow_block_1) (clear green_block_1) (clear black_block_2) (clear yellow_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on brown_block_1 orange_block_1)))
 (:metric minimize (total-cost))
)
