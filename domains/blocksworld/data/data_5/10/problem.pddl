(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 brown_block_1 brown_block_2 brown_block_3 blue_block_1 red_block_2 red_block_3 - block
 )
 (:init (ontable red_block_1) (ontable brown_block_1) (on brown_block_2 red_block_1) (ontable brown_block_3) (on blue_block_1 brown_block_2) (on red_block_2 brown_block_3) (on red_block_3 red_block_2) (clear brown_block_1) (clear blue_block_1) (clear red_block_3) (handempty) (= (total-cost) 0))
 (:goal (and (clear brown_block_2)))
 (:constraints (sometime (holding blue_block_1)) (sometime-before (holding blue_block_1) (on brown_block_3 red_block_3)) (sometime (not (on red_block_2 red_block_3))) (sometime-after (not (on red_block_2 red_block_3)) (clear red_block_2)) (sometime (or (holding red_block_2) (not (ontable red_block_1)))) (sometime (or (ontable blue_block_1) (holding brown_block_3))) (sometime (or (ontable red_block_3) (holding red_block_1))))
 (:metric minimize (total-cost))
)
