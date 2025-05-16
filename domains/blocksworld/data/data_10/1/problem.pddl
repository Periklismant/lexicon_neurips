(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   brown_block_1 yellow_block_1 white_block_1 grey_block_1 black_block_1 red_block_1 white_block_2 - block
 )
 (:init (ontable brown_block_1) (ontable yellow_block_1) (on white_block_1 brown_block_1) (on grey_block_1 yellow_block_1) (on black_block_1 grey_block_1) (ontable red_block_1) (on white_block_2 black_block_1) (clear white_block_1) (clear red_block_1) (clear white_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding brown_block_1)))
 (:constraints (sometime (not (ontable brown_block_1))) (sometime-after (not (ontable brown_block_1)) (and (not (clear white_block_1)) (not (ontable red_block_1)))) (sometime (and (clear grey_block_1) (holding black_block_1))) (sometime (and (holding white_block_2) (not (clear red_block_1)))) (sometime (clear brown_block_1)) (sometime-after (clear brown_block_1) (on yellow_block_1 grey_block_1)) (sometime (ontable white_block_1)) (sometime-before (ontable white_block_1) (not (ontable brown_block_1))) (sometime (holding white_block_1)) (sometime-after (holding white_block_1) (not (clear white_block_2))) (sometime (and (not (clear white_block_2)) (holding red_block_1))) (sometime (and (not (clear white_block_2)) (clear black_block_1))) (sometime (not (clear black_block_1))) (sometime-after (not (clear black_block_1)) (on yellow_block_1 red_block_1)) (sometime (not (clear yellow_block_1))) (sometime-after (not (clear yellow_block_1)) (clear black_block_1)))
 (:metric minimize (total-cost))
)
