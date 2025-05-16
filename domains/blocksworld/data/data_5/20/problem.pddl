(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   purple_block_1 red_block_1 purple_block_2 grey_block_1 purple_block_3 brown_block_1 white_block_1 - block
 )
 (:init (ontable purple_block_1) (on red_block_1 purple_block_1) (on purple_block_2 red_block_1) (ontable grey_block_1) (ontable purple_block_3) (on brown_block_1 purple_block_3) (on white_block_1 grey_block_1) (clear purple_block_2) (clear brown_block_1) (clear white_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable brown_block_1)))
 (:constraints (sometime (not (clear brown_block_1))) (sometime-before (not (clear brown_block_1)) (or (not (ontable purple_block_3)) (not (ontable grey_block_1)))) (sometime (not (clear purple_block_1))) (sometime-after (not (clear purple_block_1)) (holding white_block_1)) (sometime (not (ontable white_block_1))) (sometime-after (not (ontable white_block_1)) (or (holding purple_block_1) (not (ontable brown_block_1)))) (sometime (not (on red_block_1 red_block_1))) (sometime-after (not (on red_block_1 red_block_1)) (on grey_block_1 white_block_1)) (sometime (clear purple_block_3)) (sometime-before (clear purple_block_3) (holding grey_block_1)))
 (:metric minimize (total-cost))
)
