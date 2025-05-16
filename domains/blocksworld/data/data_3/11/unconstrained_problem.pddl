(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 white_block_2 yellow_block_1 orange_block_1 green_block_1 orange_block_2 red_block_1 - block
 )
 (:init (ontable white_block_1) (ontable white_block_2) (on yellow_block_1 white_block_1) (ontable orange_block_1) (on green_block_1 white_block_2) (ontable orange_block_2) (ontable red_block_1) (clear yellow_block_1) (clear orange_block_1) (clear green_block_1) (clear orange_block_2) (clear red_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable yellow_block_1)))
 (:metric minimize (total-cost))
)
