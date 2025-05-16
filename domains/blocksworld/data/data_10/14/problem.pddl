(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 purple_block_1 blue_block_1 red_block_1 grey_block_1 white_block_2 blue_block_2 - block
 )
 (:init (ontable white_block_1) (ontable purple_block_1) (on blue_block_1 white_block_1) (on red_block_1 purple_block_1) (ontable grey_block_1) (on white_block_2 blue_block_1) (on blue_block_2 white_block_2) (clear red_block_1) (clear grey_block_1) (clear blue_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (ontable blue_block_2)))
 (:constraints (sometime (not (on red_block_1 white_block_1))) (sometime-after (not (on red_block_1 white_block_1)) (ontable white_block_2)) (sometime (not (on grey_block_1 white_block_1))) (sometime-after (not (on grey_block_1 white_block_1)) (not (clear red_block_1))) (sometime (not (ontable blue_block_1))) (sometime-after (not (ontable blue_block_1)) (on purple_block_1 grey_block_1)) (sometime (clear white_block_2)) (sometime-before (clear white_block_2) (not (clear grey_block_1))) (sometime (not (ontable grey_block_1))) (sometime (not (clear blue_block_2))) (sometime-before (not (clear blue_block_2)) (or (not (clear red_block_1)) (holding white_block_2))) (sometime (holding white_block_1)) (sometime (and (clear blue_block_1) (on white_block_2 red_block_1))) (sometime (or (on blue_block_1 white_block_2) (on purple_block_1 grey_block_1))) (sometime (not (on white_block_1 blue_block_2))) (sometime-after (not (on white_block_1 blue_block_2)) (not (ontable purple_block_1))))
 (:metric minimize (total-cost))
)
