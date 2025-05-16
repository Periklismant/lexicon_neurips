(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 brown_block_1 brown_block_2 brown_block_3 purple_block_1 red_block_2 green_block_1 - block
 )
 (:init (ontable red_block_1) (on brown_block_1 red_block_1) (on brown_block_2 brown_block_1) (ontable brown_block_3) (on purple_block_1 brown_block_3) (ontable red_block_2) (on green_block_1 red_block_2) (clear brown_block_2) (clear purple_block_1) (clear green_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear brown_block_3)))
 (:metric minimize (total-cost))
)
