(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   purple_block_1 green_block_1 purple_block_2 red_block_1 green_block_2 red_block_2 orange_block_1 - block
 )
 (:init (ontable purple_block_1) (ontable green_block_1) (ontable purple_block_2) (on red_block_1 purple_block_2) (on green_block_2 green_block_1) (on red_block_2 purple_block_1) (on orange_block_1 red_block_2) (clear red_block_1) (clear green_block_2) (clear orange_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable red_block_2)))
 (:constraints (sometime (holding orange_block_1)) (sometime-before (holding orange_block_1) (or (holding green_block_2) (clear green_block_1))) (sometime (not (on red_block_2 green_block_2))) (sometime-after (not (on red_block_2 green_block_2)) (and (on purple_block_2 green_block_1) (holding purple_block_1))) (sometime (clear red_block_2)) (sometime-before (clear red_block_2) (on purple_block_2 orange_block_1)) (always (not (ontable orange_block_1))) (sometime (on green_block_2 red_block_1)) (sometime (not (clear green_block_1))) (sometime-after (not (clear green_block_1)) (not (clear orange_block_1))) (sometime (or (ontable green_block_2) (ontable red_block_1))) (sometime (not (on purple_block_2 red_block_1))) (sometime-after (not (on purple_block_2 red_block_1)) (clear purple_block_2)) (sometime (not (ontable red_block_1))) (sometime-after (not (ontable red_block_1)) (holding purple_block_2)) (sometime (not (on green_block_1 purple_block_1))) (sometime-after (not (on green_block_1 purple_block_1)) (and (not (clear orange_block_1)) (on green_block_2 red_block_1))))
 (:metric minimize (total-cost))
)
