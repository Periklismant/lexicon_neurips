(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 white_block_2 purple_block_1 red_block_1 white_block_3 orange_block_1 orange_block_2 - block
 )
 (:init (ontable white_block_1) (ontable white_block_2) (on purple_block_1 white_block_1) (on red_block_1 purple_block_1) (ontable white_block_3) (on orange_block_1 red_block_1) (on orange_block_2 white_block_2) (clear white_block_3) (clear orange_block_1) (clear orange_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on white_block_2 purple_block_1)))
 (:metric minimize (total-cost))
)
