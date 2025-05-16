(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   purple_block_1 green_block_1 purple_block_2 red_block_1 green_block_2 red_block_2 orange_block_1 - block
 )
 (:init (ontable purple_block_1) (ontable green_block_1) (ontable purple_block_2) (on red_block_1 purple_block_2) (on green_block_2 green_block_1) (on red_block_2 purple_block_1) (on orange_block_1 red_block_2) (clear red_block_1) (clear green_block_2) (clear orange_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable red_block_2)))
 (:metric minimize (total-cost))
)
