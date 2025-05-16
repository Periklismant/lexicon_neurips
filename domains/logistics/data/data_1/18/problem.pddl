(define (problem logistics-problem)
 (:domain logistics-domain)
 (:objects
   l1_2 l1_3 l1_4 l1_5 l2_2 l2_3 l2_4 l2_5 - location
   c1 c2 - city
   p1 p2 - package
   t1 t2 - truck
   a1 a2 - airplane
   l1_1 l2_1 - airport
 )
 (:init (incity l1_1 c1) (incity l1_2 c1) (incity l1_3 c1) (incity l1_4 c1) (incity l1_5 c1) (incity l2_1 c2) (incity l2_2 c2) (incity l2_3 c2) (incity l2_4 c2) (incity l2_5 c2) (at_ t1 l1_5) (at_ t2 l2_5) (at_ p1 l1_3) (at_ p2 l1_3) (at_ a1 l1_1) (at_ a2 l2_1) (= (total-cost) 0))
 (:goal (and (at_ p1 l1_3) (at_ p2 l1_3)))
 (:constraints (sometime (or (in p2 a1) (at_ p2 l2_5))))
 (:metric minimize (total-cost))
)
