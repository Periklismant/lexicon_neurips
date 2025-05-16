(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   brown_block_1 yellow_block_1 white_block_1 grey_block_1 black_block_1 red_block_1 white_block_2 - block
 )
 (:init (ontable brown_block_1) (ontable yellow_block_1) (on white_block_1 brown_block_1) (on grey_block_1 yellow_block_1) (on black_block_1 grey_block_1) (ontable red_block_1) (on white_block_2 black_block_1) (clear white_block_1) (clear red_block_1) (clear white_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding brown_block_1)))
 (:constraints (sometime (not (ontable brown_block_1))) (sometime-after (not (ontable brown_block_1)) (and (not (clear white_block_1)) (not (ontable red_block_1)))))
 (:metric minimize (total-cost))
)
