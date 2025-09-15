(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   cabinettype tvstandtype diningtabletype handtowelholdertype - receptacletype
   saltshakertype glassbottletype keychaintype laptoptype boxtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   cabinet_1 tvstand_2 diningtable_3 handtowelholder_4 fridge_5 microwave_6 fridge_7 - receptacle
   saltshaker_1 glassbottle_2 keychain_3 laptop_4 box_5 - obj
 )
 (:init (receptacletype_0 cabinet_1 cabinettype) (receptacletype_0 tvstand_2 tvstandtype) (receptacletype_0 diningtable_3 diningtabletype) (receptacletype_0 handtowelholder_4 handtowelholdertype) (receptacletype_0 fridge_5 fridgetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 saltshaker_1 saltshakertype) (objecttype_0 glassbottle_2 glassbottletype) (objecttype_0 keychain_3 keychaintype) (objecttype_0 laptop_4 laptoptype) (objecttype_0 box_5 boxtype) (cancontain cabinettype saltshakertype) (cancontain cabinettype glassbottletype) (cancontain cabinettype boxtype) (cancontain diningtabletype saltshakertype) (cancontain diningtabletype glassbottletype) (cancontain diningtabletype keychaintype) (cancontain diningtabletype laptoptype) (cancontain diningtabletype boxtype) (cancontain fridgetype glassbottletype) (cancontain microwavetype glassbottletype) (pickupable saltshaker_1) (pickupable glassbottle_2) (pickupable keychain_3) (pickupable laptop_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation cabinet_1 location5) (receptacleatlocation tvstand_2 location5) (receptacleatlocation diningtable_3 location3) (receptacleatlocation handtowelholder_4 location3) (receptacleatlocation fridge_5 location3) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location2) (inreceptacle saltshaker_1 cabinet_1) (inreceptacle glassbottle_2 microwave_6) (inreceptacle keychain_3 diningtable_3) (inreceptacle laptop_4 diningtable_3) (inreceptacle box_5 cabinet_1) (objectatlocation saltshaker_1 location5) (objectatlocation glassbottle_2 location3) (objectatlocation keychain_3 location3) (objectatlocation laptop_4 location3) (objectatlocation box_5 location5) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 boxtype) (receptacletype_0 ?r_0 diningtabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 keychaintype) (receptacletype_0 ?r_0 diningtabletype) (inreceptacle ?o2 ?r_0))))))))
 (:constraints (sometime (or (objectatlocation keychain_3 location2) (holds agent1 laptop_4))) (sometime (checked agent1)) (sometime (or (atlocation agent1 location4) (holds agent1 saltshaker_1))) (sometime (atlocation agent1 location4)) (sometime (or (holds agent1 saltshaker_1) (checked location4))))
 (:metric minimize (total-cost))
)
