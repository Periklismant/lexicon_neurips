(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 black_block_1 green_block_1 purple_block_1 red_block_1 purple_block_2 black_block_2 - block
 )
 (:init (ontable yellow_block_1) (ontable black_block_1) (on green_block_1 yellow_block_1) (ontable purple_block_1) (on red_block_1 black_block_1) (on purple_block_2 red_block_1) (ontable black_block_2) (clear green_block_1) (clear purple_block_1) (clear purple_block_2) (clear black_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on red_block_1 yellow_block_1)))
 (:constraints (sometime (not (ontable yellow_block_1))) (sometime (ontable purple_block_2)) (sometime-before (ontable purple_block_2) (on red_block_1 green_block_1)) (sometime (and (on purple_block_1 green_block_1) (on green_block_1 black_block_2))) (sometime (not (on black_block_1 black_block_2))) (sometime-after (not (on black_block_1 black_block_2)) (or (not (ontable black_block_1)) (ontable red_block_1))) (sometime (not (clear purple_block_2))) (sometime-before (not (clear purple_block_2)) (clear yellow_block_1)) (sometime (holding purple_block_1)) (sometime (not (on purple_block_2 red_block_1))) (sometime-before (not (on purple_block_2 red_block_1)) (or (not (clear purple_block_1)) (holding green_block_1))))
 (:metric minimize (total-cost))
)
