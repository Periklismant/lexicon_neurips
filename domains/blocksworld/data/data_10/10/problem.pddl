(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 red_block_1 red_block_2 yellow_block_1 green_block_2 yellow_block_2 blue_block_1 - block
 )
 (:init (ontable green_block_1) (on red_block_1 green_block_1) (ontable red_block_2) (on yellow_block_1 red_block_2) (ontable green_block_2) (ontable yellow_block_2) (on blue_block_1 yellow_block_2) (clear red_block_1) (clear yellow_block_1) (clear green_block_2) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:constraints (sometime (on green_block_2 red_block_2)) (sometime (holding red_block_1)) (sometime-before (holding red_block_1) (or (on red_block_1 blue_block_1) (on red_block_2 green_block_2))) (sometime (and (on yellow_block_1 blue_block_1) (not (ontable red_block_2)))) (sometime (not (ontable green_block_1))) (sometime-after (not (ontable green_block_1)) (not (clear blue_block_1))) (sometime (ontable red_block_1)) (sometime-before (ontable red_block_1) (not (ontable green_block_1))) (sometime (not (clear red_block_1))) (sometime-before (not (clear red_block_1)) (holding yellow_block_2)) (sometime (holding green_block_2)) (sometime (or (holding yellow_block_2) (ontable yellow_block_1))) (sometime (not (clear yellow_block_2))) (sometime-after (not (clear yellow_block_2)) (holding green_block_2)) (sometime (clear green_block_1)) (sometime-before (clear green_block_1) (and (clear yellow_block_2) (not (clear yellow_block_1)))))
 (:metric minimize (total-cost))
)
