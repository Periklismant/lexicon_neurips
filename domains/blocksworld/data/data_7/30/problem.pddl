(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   grey_block_1 white_block_1 purple_block_1 white_block_2 red_block_1 yellow_block_1 blue_block_1 - block
 )
 (:init (ontable grey_block_1) (ontable white_block_1) (on purple_block_1 white_block_1) (on white_block_2 purple_block_1) (ontable red_block_1) (on yellow_block_1 red_block_1) (on blue_block_1 yellow_block_1) (clear grey_block_1) (clear white_block_2) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable yellow_block_1)))
 (:constraints (sometime (holding yellow_block_1)) (sometime-before (holding yellow_block_1) (or (on blue_block_1 white_block_2) (on blue_block_1 purple_block_1))) (always (not (ontable blue_block_1))) (sometime (holding white_block_2)) (sometime (holding blue_block_1)) (sometime-after (holding blue_block_1) (holding purple_block_1)) (sometime (not (ontable white_block_2))) (sometime-after (not (ontable white_block_2)) (or (on purple_block_1 yellow_block_1) (not (clear red_block_1)))) (sometime (not (on white_block_1 blue_block_1))) (sometime-after (not (on white_block_1 blue_block_1)) (or (not (ontable white_block_1)) (not (on purple_block_1 white_block_1)))) (sometime (and (clear white_block_1) (not (clear white_block_2)))))
 (:metric minimize (total-cost))
)
