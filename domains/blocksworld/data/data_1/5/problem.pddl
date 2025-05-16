(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 yellow_block_1 yellow_block_2 purple_block_1 grey_block_1 red_block_2 green_block_1 - block
 )
 (:init (ontable red_block_1) (ontable yellow_block_1) (ontable yellow_block_2) (on purple_block_1 red_block_1) (ontable grey_block_1) (ontable red_block_2) (on green_block_1 red_block_2) (clear yellow_block_1) (clear yellow_block_2) (clear purple_block_1) (clear grey_block_1) (clear green_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding yellow_block_2)))
 (:constraints (sometime (not (ontable yellow_block_2))) (sometime-before (not (ontable yellow_block_2)) (holding red_block_2)))
 (:metric minimize (total-cost))
)
