(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   blue_block_1 black_block_1 blue_block_2 blue_block_3 white_block_1 white_block_2 brown_block_1 - block
 )
 (:init (ontable blue_block_1) (ontable black_block_1) (ontable blue_block_2) (on blue_block_3 black_block_1) (ontable white_block_1) (on white_block_2 blue_block_2) (ontable brown_block_1) (clear blue_block_1) (clear blue_block_3) (clear white_block_1) (clear white_block_2) (clear brown_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding white_block_1)))
 (:constraints (sometime (not (ontable white_block_1))) (sometime-after (not (ontable white_block_1)) (or (on blue_block_3 white_block_2) (ontable blue_block_3))) (sometime (not (clear white_block_1))) (sometime-before (not (clear white_block_1)) (holding white_block_2)) (sometime (on blue_block_3 white_block_2)) (sometime (or (on white_block_1 blue_block_3) (clear blue_block_2))) (sometime (or (not (ontable brown_block_1)) (on blue_block_3 brown_block_1))) (sometime (not (on brown_block_1 blue_block_2))) (sometime-after (not (on brown_block_1 blue_block_2)) (not (clear brown_block_1))) (sometime (or (not (clear brown_block_1)) (on brown_block_1 white_block_1))))
 (:metric minimize (total-cost))
)
