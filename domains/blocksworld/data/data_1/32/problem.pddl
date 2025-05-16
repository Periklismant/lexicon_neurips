(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 blue_block_1 black_block_1 green_block_1 white_block_2 red_block_1 grey_block_1 - block
 )
 (:init (ontable white_block_1) (ontable blue_block_1) (ontable black_block_1) (on green_block_1 black_block_1) (on white_block_2 green_block_1) (ontable red_block_1) (ontable grey_block_1) (clear white_block_1) (clear blue_block_1) (clear white_block_2) (clear red_block_1) (clear grey_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable green_block_1)))
 (:constraints (sometime (on blue_block_1 white_block_2)))
 (:metric minimize (total-cost))
)
