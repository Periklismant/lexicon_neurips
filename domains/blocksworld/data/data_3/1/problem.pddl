(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 white_block_2 green_block_1 brown_block_1 yellow_block_1 orange_block_1 white_block_3 - block
 )
 (:init (ontable white_block_1) (on white_block_2 white_block_1) (on green_block_1 white_block_2) (on brown_block_1 green_block_1) (ontable yellow_block_1) (ontable orange_block_1) (on white_block_3 orange_block_1) (clear brown_block_1) (clear yellow_block_1) (clear white_block_3) (handempty) (= (total-cost) 0))
 (:goal (and (ontable brown_block_1)))
 (:constraints (sometime (not (ontable green_block_1))) (sometime-after (not (ontable green_block_1)) (clear white_block_1)) (sometime (not (clear brown_block_1))) (sometime-before (not (clear brown_block_1)) (on yellow_block_1 orange_block_1)) (sometime (not (on brown_block_1 green_block_1))) (sometime-before (not (on brown_block_1 green_block_1)) (or (holding yellow_block_1) (holding white_block_1))))
 (:metric minimize (total-cost))
)
