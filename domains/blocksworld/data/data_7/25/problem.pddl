(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 purple_block_1 red_block_1 brown_block_1 yellow_block_1 blue_block_1 orange_block_1 - block
 )
 (:init (ontable green_block_1) (ontable purple_block_1) (on red_block_1 purple_block_1) (ontable brown_block_1) (on yellow_block_1 brown_block_1) (on blue_block_1 green_block_1) (on orange_block_1 blue_block_1) (clear red_block_1) (clear yellow_block_1) (clear orange_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on green_block_1 yellow_block_1)))
 (:constraints (sometime (holding yellow_block_1)) (sometime (or (not (ontable purple_block_1)) (on yellow_block_1 green_block_1))) (sometime (not (on purple_block_1 red_block_1))) (sometime-after (not (on purple_block_1 red_block_1)) (or (not (ontable orange_block_1)) (ontable green_block_1))) (sometime (not (clear yellow_block_1))) (sometime-before (not (clear yellow_block_1)) (ontable red_block_1)) (sometime (holding orange_block_1)) (sometime-before (holding orange_block_1) (or (on brown_block_1 red_block_1) (not (clear yellow_block_1)))) (sometime (clear brown_block_1)) (sometime (holding red_block_1)))
 (:metric minimize (total-cost))
)
