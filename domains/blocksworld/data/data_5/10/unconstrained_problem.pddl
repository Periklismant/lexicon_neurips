(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 brown_block_1 brown_block_2 brown_block_3 blue_block_1 red_block_2 red_block_3 - block
 )
 (:init (ontable red_block_1) (ontable brown_block_1) (on brown_block_2 red_block_1) (ontable brown_block_3) (on blue_block_1 brown_block_2) (on red_block_2 brown_block_3) (on red_block_3 red_block_2) (clear brown_block_1) (clear blue_block_1) (clear red_block_3) (handempty) (= (total-cost) 0))
 (:goal (and (clear brown_block_2)))
 (:metric minimize (total-cost))
)
