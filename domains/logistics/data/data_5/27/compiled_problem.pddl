(define (problem liftedtcore_logistics-problem)
 (:domain liftedtcore_logistics-domain)
 (:objects
   l1_2 l1_3 l1_4 l2_2 l2_5 - location
   c1 c2 - city
   t1 - truck
   a1 a2 - airplane
   l2_1 - airport
 )
 (:init (incity l1_1 c1) (incity l1_2 c1) (incity l1_3 c1) (incity l1_4 c1) (incity l1_5 c1) (incity l2_1 c2) (incity l2_2 c2) (incity l2_3 c2) (incity l2_4 c2) (incity l2_5 c2) (at_ t1 l1_2) (at_ t2 l2_5) (at_ p1 l1_2) (at_ p2 l2_1) (at_ a1 l1_1) (at_ a2 l2_1) (hold_6) (= (total-cost) 0))
 (:goal (and (at_ p1 l2_1) (at_ p2 l1_5) (hold_0) (hold_1) (hold_2) (hold_3) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
