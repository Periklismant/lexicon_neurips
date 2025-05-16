(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   blue_block_1 black_block_1 blue_block_2 red_block_1 grey_block_1 purple_block_1 green_block_1 - block
 )
 (:init (ontable blue_block_1) (ontable black_block_1) (on blue_block_2 blue_block_1) (on red_block_1 blue_block_2) (ontable grey_block_1) (on purple_block_1 red_block_1) (on green_block_1 grey_block_1) (clear black_block_1) (clear purple_block_1) (clear green_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on blue_block_1 purple_block_1)))
 (:constraints (always (not (ontable purple_block_1))) (sometime (holding purple_block_1)) (sometime-after (holding purple_block_1) (not (ontable black_block_1))) (sometime (on blue_block_1 green_block_1)))
 (:metric minimize (total-cost))
)
