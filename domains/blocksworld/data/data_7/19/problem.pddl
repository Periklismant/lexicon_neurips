(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 brown_block_1 brown_block_2 brown_block_3 purple_block_1 red_block_2 green_block_1 - block
 )
 (:init (ontable red_block_1) (on brown_block_1 red_block_1) (on brown_block_2 brown_block_1) (ontable brown_block_3) (on purple_block_1 brown_block_3) (ontable red_block_2) (on green_block_1 red_block_2) (clear brown_block_2) (clear purple_block_1) (clear green_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear brown_block_3)))
 (:constraints (sometime (not (clear purple_block_1))) (sometime-before (not (clear purple_block_1)) (not (ontable red_block_2))) (sometime (or (on purple_block_1 red_block_1) (on brown_block_3 brown_block_1))) (sometime (not (on brown_block_3 red_block_2))) (sometime-after (not (on brown_block_3 red_block_2)) (holding brown_block_1)) (sometime (not (on brown_block_2 brown_block_3))) (sometime-after (not (on brown_block_2 brown_block_3)) (not (ontable brown_block_3))) (sometime (not (clear red_block_2))) (sometime-after (not (clear red_block_2)) (not (on brown_block_2 brown_block_1))) (sometime (not (ontable brown_block_2))) (sometime-after (not (ontable brown_block_2)) (on green_block_1 brown_block_2)) (sometime (not (on purple_block_1 brown_block_3))) (sometime-before (not (on purple_block_1 brown_block_3)) (clear red_block_2)))
 (:metric minimize (total-cost))
)
