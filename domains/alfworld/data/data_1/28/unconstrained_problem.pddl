(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bedtype cabinettype desktype toiletpaperhangertype - receptacletype
   appletype mugtype keychaintype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   bed_1 cabinet_2 desk_3 fridge_4 toiletpaperhanger_5 microwave_6 fridge_7 - receptacle
   apple_1 apple_2 mug_3 keychain_4 mug_5 - obj
 )
 (:init (receptacletype_0 bed_1 bedtype) (receptacletype_0 cabinet_2 cabinettype) (receptacletype_0 desk_3 desktype) (receptacletype_0 fridge_4 fridgetype) (receptacletype_0 toiletpaperhanger_5 toiletpaperhangertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 apple_1 appletype) (objecttype_0 apple_2 appletype) (objecttype_0 mug_3 mugtype) (objecttype_0 keychain_4 keychaintype) (objecttype_0 mug_5 mugtype) (cancontain cabinettype mugtype) (cancontain desktype mugtype) (cancontain desktype keychaintype) (cancontain fridgetype appletype) (cancontain fridgetype mugtype) (cancontain microwavetype appletype) (cancontain microwavetype mugtype) (pickupable apple_1) (cleanable apple_1) (heatable apple_1) (coolable apple_1) (sliceable apple_1) (pickupable apple_2) (cleanable apple_2) (heatable apple_2) (coolable apple_2) (sliceable apple_2) (pickupable mug_3) (isreceptacleobject mug_3) (cleanable mug_3) (heatable mug_3) (coolable mug_3) (pickupable keychain_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation bed_1 location5) (receptacleatlocation cabinet_2 location2) (receptacleatlocation desk_3 location4) (receptacleatlocation fridge_4 location4) (receptacleatlocation toiletpaperhanger_5 location1) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location1) (inreceptacle apple_1 fridge_7) (inreceptacle apple_2 microwave_6) (inreceptacle mug_3 fridge_4) (inreceptacle keychain_4 desk_3) (inreceptacle mug_5 fridge_4) (objectatlocation apple_1 location1) (objectatlocation apple_2 location3) (objectatlocation mug_3 location4) (objectatlocation keychain_4 location4) (objectatlocation mug_5 location4) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o mugtype) (receptacletype_0 ?r desktype))))))
 (:metric minimize (total-cost))
)
