(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   black_block_1 red_block_1 white_block_1 white_block_2 black_block_2 red_block_2 orange_block_1 - block
 )
 (:init (ontable black_block_1) (ontable red_block_1) (on white_block_1 black_block_1) (on white_block_2 red_block_1) (on black_block_2 white_block_1) (on red_block_2 white_block_2) (on orange_block_1 red_block_2) (clear black_block_2) (clear orange_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable red_block_2)))
 (:metric minimize (total-cost))
)
