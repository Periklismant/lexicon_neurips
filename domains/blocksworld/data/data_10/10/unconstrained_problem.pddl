(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 red_block_1 red_block_2 yellow_block_1 green_block_2 yellow_block_2 blue_block_1 - block
 )
 (:init (ontable green_block_1) (on red_block_1 green_block_1) (ontable red_block_2) (on yellow_block_1 red_block_2) (ontable green_block_2) (ontable yellow_block_2) (on blue_block_1 yellow_block_2) (clear red_block_1) (clear yellow_block_1) (clear green_block_2) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:metric minimize (total-cost))
)
