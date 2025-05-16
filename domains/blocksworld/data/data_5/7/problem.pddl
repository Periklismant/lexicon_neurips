(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 orange_block_1 red_block_2 black_block_1 white_block_1 grey_block_1 yellow_block_1 - block
 )
 (:init (ontable red_block_1) (ontable orange_block_1) (ontable red_block_2) (on black_block_1 orange_block_1) (on white_block_1 red_block_1) (on grey_block_1 black_block_1) (on yellow_block_1 grey_block_1) (clear red_block_2) (clear white_block_1) (clear yellow_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding red_block_2)))
 (:constraints (sometime (holding black_block_1)) (sometime (not (clear red_block_2))) (sometime-before (not (clear red_block_2)) (and (holding white_block_1) (ontable black_block_1))) (sometime (and (on yellow_block_1 red_block_1) (clear orange_block_1))) (sometime (clear grey_block_1)) (sometime (and (not (ontable orange_block_1)) (clear orange_block_1))))
 (:metric minimize (total-cost))
)
