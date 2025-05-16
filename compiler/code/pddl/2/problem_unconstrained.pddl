(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 blue_block_1 - block
 )
 (:init (ontable green_block_1)
        (on blue_block_1 green_block_1) 
        (clear blue_block_1)
        (handempty)
 )
 (:goal (holding green_block_1))
)
