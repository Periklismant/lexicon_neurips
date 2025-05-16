(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   brown_block_1 red_block_1 grey_block_1 red_block_2 blue_block_1 brown_block_2 brown_block_3 - block
 )
 (:init (ontable brown_block_1) (ontable red_block_1) (on grey_block_1 red_block_1) (ontable red_block_2) (on blue_block_1 grey_block_1) (on brown_block_2 blue_block_1) (on brown_block_3 brown_block_1) (clear red_block_2) (clear brown_block_2) (clear brown_block_3) (handempty) (= (total-cost) 0))
 (:goal (and (holding brown_block_1)))
 (:metric minimize (total-cost))
)
