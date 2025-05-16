(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   brown_block_1 brown_block_2 green_block_1 black_block_1 black_block_2 black_block_3 grey_block_1 - block
 )
 (:init (ontable brown_block_1) (ontable brown_block_2) (on green_block_1 brown_block_2) (ontable black_block_1) (on black_block_2 black_block_1) (on black_block_3 brown_block_1) (on grey_block_1 green_block_1) (clear black_block_2) (clear black_block_3) (clear grey_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding black_block_3)))
 (:constraints (sometime (not (on black_block_3 brown_block_1))) (sometime-before (not (on black_block_3 brown_block_1)) (holding brown_block_2)) (sometime (not (on green_block_1 green_block_1))) (sometime-after (not (on green_block_1 green_block_1)) (or (holding black_block_1) (on green_block_1 black_block_1))) (sometime (or (clear green_block_1) (on brown_block_1 black_block_1))) (sometime (not (on black_block_3 black_block_1))) (sometime-after (not (on black_block_3 black_block_1)) (or (not (ontable brown_block_2)) (not (clear brown_block_1)))) (sometime (clear brown_block_1)) (sometime-before (clear brown_block_1) (on black_block_2 green_block_1)))
 (:metric minimize (total-cost))
)
