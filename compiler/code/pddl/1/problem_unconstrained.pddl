(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 brown_block_1 blue_block_1 orange_block_1 blue_block_2 black_block_1 black_block_2 black_block_3 - block
 )
 (:init (ontable green_block_1) (ontable brown_block_1) (ontable blue_block_1) (on orange_block_1 blue_block_1) (ontable blue_block_2) (on black_block_1 orange_block_1) (on black_block_2 blue_block_2) (on black_block_3 black_block_2) (clear green_block_1) (clear brown_block_1) (clear black_block_1) (clear black_block_3) (handempty))
 (:goal (and (holding brown_block_1)))
)
