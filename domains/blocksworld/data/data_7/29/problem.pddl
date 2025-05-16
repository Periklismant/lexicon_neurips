(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 purple_block_1 white_block_1 black_block_1 grey_block_1 blue_block_1 blue_block_2 - block
 )
 (:init (ontable yellow_block_1) (on purple_block_1 yellow_block_1) (ontable white_block_1) (on black_block_1 white_block_1) (ontable grey_block_1) (on blue_block_1 black_block_1) (ontable blue_block_2) (clear purple_block_1) (clear grey_block_1) (clear blue_block_1) (clear blue_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding grey_block_1)))
 (:constraints (sometime (and (on blue_block_2 black_block_1) (not (clear blue_block_1)))) (sometime (not (ontable white_block_1))) (sometime (and (on grey_block_1 blue_block_1) (clear white_block_1))) (sometime (or (holding blue_block_2) (not (clear blue_block_1)))) (sometime (not (ontable black_block_1))) (sometime-after (not (ontable black_block_1)) (or (holding blue_block_2) (not (clear purple_block_1)))) (sometime (or (on white_block_1 blue_block_1) (not (clear purple_block_1)))) (sometime (not (ontable grey_block_1))) (sometime-before (not (ontable grey_block_1)) (not (clear purple_block_1))))
 (:metric minimize (total-cost))
)
