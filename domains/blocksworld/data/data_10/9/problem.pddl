(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 red_block_1 brown_block_1 black_block_1 green_block_1 brown_block_2 black_block_2 - block
 )
 (:init (ontable white_block_1) (on red_block_1 white_block_1) (ontable brown_block_1) (on black_block_1 brown_block_1) (on green_block_1 red_block_1) (on brown_block_2 black_block_1) (ontable black_block_2) (clear green_block_1) (clear brown_block_2) (clear black_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on brown_block_1 green_block_1)))
 (:constraints (sometime (not (clear green_block_1))) (sometime-after (not (clear green_block_1)) (and (not (clear brown_block_1)) (on red_block_1 black_block_1))) (sometime (ontable brown_block_1)) (sometime-after (ontable brown_block_1) (on white_block_1 brown_block_1)) (always (not (ontable brown_block_2))) (sometime (or (not (clear black_block_2)) (on white_block_1 green_block_1))) (always (not (ontable black_block_1))) (sometime (on red_block_1 black_block_1)) (sometime (not (on green_block_1 black_block_1))) (sometime-after (not (on green_block_1 black_block_1)) (not (clear black_block_2))) (sometime (on red_block_1 brown_block_1)) (sometime (not (on red_block_1 black_block_1))) (sometime-after (not (on red_block_1 black_block_1)) (holding brown_block_2)) (sometime (not (ontable brown_block_1))) (sometime-before (not (ontable brown_block_1)) (or (holding green_block_1) (holding white_block_1))))
 (:metric minimize (total-cost))
)
