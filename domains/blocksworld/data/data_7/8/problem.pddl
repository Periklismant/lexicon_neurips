(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   blue_block_1 black_block_1 grey_block_1 yellow_block_1 grey_block_2 brown_block_1 red_block_1 - block
 )
 (:init (ontable blue_block_1) (on black_block_1 blue_block_1) (on grey_block_1 black_block_1) (ontable yellow_block_1) (on grey_block_2 grey_block_1) (on brown_block_1 yellow_block_1) (ontable red_block_1) (clear grey_block_2) (clear brown_block_1) (clear red_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding grey_block_1)))
 (:constraints (always (not (ontable grey_block_2))) (sometime (not (clear yellow_block_1))) (sometime-after (not (clear yellow_block_1)) (or (on black_block_1 brown_block_1) (holding black_block_1))) (sometime (clear black_block_1)) (sometime-before (clear black_block_1) (or (not (ontable yellow_block_1)) (clear blue_block_1))) (sometime (not (clear blue_block_1))) (sometime-after (not (clear blue_block_1)) (on grey_block_1 blue_block_1)) (sometime (not (on blue_block_1 brown_block_1))) (sometime-after (not (on blue_block_1 brown_block_1)) (or (not (on black_block_1 blue_block_1)) (not (clear red_block_1)))) (sometime (or (on yellow_block_1 black_block_1) (not (ontable red_block_1)))) (sometime (not (clear grey_block_1))) (sometime-after (not (clear grey_block_1)) (or (holding red_block_1) (not (ontable red_block_1)))))
 (:metric minimize (total-cost))
)
