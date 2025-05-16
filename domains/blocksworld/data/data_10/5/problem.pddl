(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   grey_block_1 grey_block_2 white_block_1 blue_block_1 purple_block_1 orange_block_1 red_block_1 - block
 )
 (:init (ontable grey_block_1) (ontable grey_block_2) (on white_block_1 grey_block_1) (on blue_block_1 white_block_1) (on purple_block_1 blue_block_1) (ontable orange_block_1) (on red_block_1 grey_block_2) (clear purple_block_1) (clear orange_block_1) (clear red_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on orange_block_1 blue_block_1)))
 (:constraints (sometime (and (holding grey_block_1) (on orange_block_1 grey_block_2))) (sometime (not (clear purple_block_1))) (sometime-before (not (clear purple_block_1)) (or (ontable white_block_1) (not (ontable grey_block_2)))) (sometime (on grey_block_1 white_block_1)) (sometime (and (not (on blue_block_1 white_block_1)) (on grey_block_2 red_block_1))) (sometime (holding orange_block_1)) (sometime-after (holding orange_block_1) (and (not (clear purple_block_1)) (on purple_block_1 orange_block_1))) (always (not (ontable purple_block_1))) (sometime (not (on grey_block_2 red_block_1))) (sometime-after (not (on grey_block_2 red_block_1)) (not (clear purple_block_1))) (sometime (or (ontable blue_block_1) (holding red_block_1))) (sometime (not (clear orange_block_1))) (sometime-before (not (clear orange_block_1)) (or (on purple_block_1 red_block_1) (not (ontable grey_block_2)))) (sometime (holding white_block_1)))
 (:metric minimize (total-cost))
)
