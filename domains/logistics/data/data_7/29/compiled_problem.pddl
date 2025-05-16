(define (problem liftedtcore_logistics-problem)
 (:domain liftedtcore_logistics-domain)
 (:objects
   l1_5 l2_2 l2_3 l2_4 - location
   c1 c2 - city
   t2 - truck
   a2 - airplane
   l1_1 - airport
 )
 (:init (incity l1_1 c1) (incity l1_2 c1) (incity l1_3 c1) (incity l1_4 c1) (incity l1_5 c1) (incity l2_1 c2) (incity l2_2 c2) (incity l2_3 c2) (incity l2_4 c2) (incity l2_5 c2) (at_ t1 l1_3) (at_ t2 l2_3) (at_ p1 l2_3) (at_ p2 l1_5) (at_ a1 l1_1) (at_ a2 l2_1) (hold_2) (= (total-cost) 0))
 (:goal (and (at_ p1 l1_3) (at_ p2 l1_5) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7)))
 (:metric minimize (total-cost))
)
