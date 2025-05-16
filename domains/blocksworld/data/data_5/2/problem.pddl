(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   black_block_1 red_block_1 white_block_1 white_block_2 black_block_2 red_block_2 orange_block_1 - block
 )
 (:init (ontable black_block_1) (ontable red_block_1) (on white_block_1 black_block_1) (on white_block_2 red_block_1) (on black_block_2 white_block_1) (on red_block_2 white_block_2) (on orange_block_1 red_block_2) (clear black_block_2) (clear orange_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable red_block_2)))
 (:constraints (sometime (ontable orange_block_1)) (sometime-before (ontable orange_block_1) (or (clear red_block_1) (holding white_block_2))) (sometime (not (clear red_block_1))) (sometime-after (not (clear red_block_1)) (and (holding white_block_2) (ontable black_block_2))) (sometime (on red_block_1 white_block_1)) (sometime (holding orange_block_1)) (sometime-after (holding orange_block_1) (clear white_block_1)) (sometime (clear white_block_2)) (sometime-before (clear white_block_2) (on orange_block_1 white_block_1)))
 (:metric minimize (total-cost))
)
