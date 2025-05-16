(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 white_block_1 grey_block_1 brown_block_1 blue_block_1 orange_block_1 orange_block_2 - block
 )
 (:init (ontable red_block_1) (ontable white_block_1) (on grey_block_1 red_block_1) (on brown_block_1 grey_block_1) (on blue_block_1 white_block_1) (ontable orange_block_1) (ontable orange_block_2) (clear brown_block_1) (clear blue_block_1) (clear orange_block_1) (clear orange_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (clear white_block_1)))
 (:constraints (sometime (not (clear orange_block_2))) (sometime (not (ontable orange_block_1))) (sometime (and (holding red_block_1) (not (clear orange_block_2)))) (sometime (not (ontable brown_block_1))) (sometime-after (not (ontable brown_block_1)) (holding orange_block_1)) (sometime (and (on grey_block_1 white_block_1) (clear red_block_1))) (sometime (not (on brown_block_1 orange_block_2))) (sometime-after (not (on brown_block_1 orange_block_2)) (not (ontable orange_block_2))) (sometime (not (ontable orange_block_2))) (sometime (holding blue_block_1)) (sometime-before (holding blue_block_1) (holding orange_block_1)) (sometime (not (clear blue_block_1))) (sometime-before (not (clear blue_block_1)) (or (not (clear orange_block_2)) (holding orange_block_1))) (sometime (not (on white_block_1 white_block_1))) (sometime-after (not (on white_block_1 white_block_1)) (not (clear orange_block_1))))
 (:metric minimize (total-cost))
)
