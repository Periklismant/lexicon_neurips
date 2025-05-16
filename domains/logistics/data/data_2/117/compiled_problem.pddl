(define (problem liftedtcore_logistics-problem)
 (:domain liftedtcore_logistics-domain)
 (:objects
   l1_2 l1_3 l1_4 l1_7 l1_8 l1_9 l1_10 l2_2 l2_3 l2_4 l2_5 l2_6 l2_7 l2_9 l2_10 - location
   c1 c2 - city
   t1 - truck
   a1 a2 - airplane
   l1_1 l2_1 - airport
 )
 (:init (incity l1_1 c1) (incity l1_2 c1) (incity l1_3 c1) (incity l1_4 c1) (incity l1_5 c1) (incity l1_6 c1) (incity l1_7 c1) (incity l1_8 c1) (incity l1_9 c1) (incity l1_10 c1) (incity l2_1 c2) (incity l2_2 c2) (incity l2_3 c2) (incity l2_4 c2) (incity l2_5 c2) (incity l2_6 c2) (incity l2_7 c2) (incity l2_8 c2) (incity l2_9 c2) (incity l2_10 c2) (at_ t1 l1_4) (at_ t2 l2_3) (at_ p1 l1_4) (at_ a1 l1_1) (at_ a2 l2_1) (= (total-cost) 0))
 (:goal (and (at_ p1 l2_3) (hold_0) (hold_1)))
 (:metric minimize (total-cost))
)
