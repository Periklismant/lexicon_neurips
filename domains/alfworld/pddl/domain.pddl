;; Specification in PDDL of the Alfred domain
;; Intended to be used with Fast Downward which supports PDDL 2.2 level 1 plus the :action-costs requirement from PDDL 3.1.

(define (domain alfred)
 (:requirements
    :adl
    :action-costs
    :typing
 )
 (:types
  checkable - object
  obj - checkable
  agent - checkable
  location - checkable
  receptacle - checkable
  rtype
  otype
  )

(:constants
    SinkBasinType - rtype
    MicrowaveType - rtype
    FridgeType - rtype
    KnifeType - otype
    ButterKnifeType - otype
)

 (:predicates
    (atLocation ?a - agent ?l - location)                     ; true if the agent is at the location
    (receptacleAtLocation ?r - receptacle ?l - location)      ; true if the receptacle is at the location (constant)
    (objectAtLocation ?o - obj ?l - location)              ; true if the object is at the location
    (openable ?r - receptacle)                                ; true if a receptacle is openable
    (opened ?r - receptacle)                                  ; true if a receptacle is opened
    (inReceptacle ?o - obj ?r - receptacle)                ; object ?o is in receptacle ?r
    ; unused
    (isReceptacleObject ?o - obj)                          ; true if the object can have things put inside it
    ; unused
    (inReceptacleObject ?innerObject - obj ?outerObject - obj)                ; object ?innerObject is inside object ?outerObject
    ; unused
    (isReceptacleObjectFull ?o - obj)                      ; true if the receptacle object contains something
    ; unused
    (wasInReceptacle ?o - obj ?r - receptacle)             ; object ?o was or is in receptacle ?r now or some time in the past
    (checked ?r - checkable)                                 ; whether the receptacle has been looked inside/visited
    ; unused
    (examined ?l - location)                                  ; TODO
    (receptacleType ?r - receptacle ?t - rtype)               ; the type of receptacle (Cabinet vs Cabinet|01|2...)
    (canContain ?rt - rtype ?ot - otype)                      ; true if receptacle can hold object
    (objectType ?o - obj ?t - otype)                       ; the type of object (Apple vs Apple|01|2...)
    (holds ?a - agent ?o - obj)                            ; object ?o is held by agent ?a
    (holdsAny ?a - agent)                                     ; agent ?a holds an object
    ; unused
    (holdsAnyReceptacleObject ?a - agent)                        ; agent ?a holds a receptacle object
    ; unused
    (full ?r - receptacle)                                    ; true if the receptacle has no remaining space
    (isClean ?o - obj)                                     ; true if the object has been clean in sink
    (cleanable ?o - obj)                                   ; true if the object can be placed in a sink
    (isHot ?o - obj)                                       ; true if the object has been heated up
    (heatable ?o - obj)                                    ; true if the object can be heated up in a microwave
    (isCool ?o - obj)                                      ; true if the object has been cooled
    (coolable ?o - obj)                                    ; true if the object can be cooled in the fridge
    (pickupable ?o - obj)                                   ; true if the object can be picked up
    ; unused
    (moveable ?o - obj)                                      ; true if the object can be moved
    (toggleable ?o - obj)                                  ; true if the object can be turned on/off
    (isOn ?o - obj)                                        ; true if the object is on
    (isToggled ?o - obj)                                   ; true if the object has been toggled
    (sliceable ?o - obj)                                   ; true if the object can be sliced
    (isSliced ?o - obj)                                    ; true if the object is sliced
 )



;; All actions are specified such that the final arguments are the ones used
;; for performing actions in Unity.


(:action look
    :parameters (?a - agent ?l - location)
    :precondition
        (and
            (atLocation ?a ?l)
        )
    :effect
        (and
            (checked ?l)
        )
)

(:action inventory
    :parameters (?a - agent)
    :precondition
        ()
    :effect
        (and
            (checked ?a)
        )
)

(:action examineReceptacle
    :parameters (?a - agent ?r - receptacle)
    :precondition
        (and
            (exists (?l - location)
                (and
                    (atLocation ?a ?l)
                    (receptacleAtLocation ?r ?l)
                )
            )
        )
    :effect
        (and
            (checked ?r)
        )
)

(:action examineObject
    :parameters (?a - agent ?o - obj)
    :precondition
        (or
            (exists (?l - location)
                (exists (?r - receptacle)
                    (and
                        (atLocation ?a ?l)
                        (receptacleAtLocation ?r ?l)
                        ; (objectAtLocation ?o ?l)
                        (inReceptacle ?o ?r)
                        (or (not (openable ?r)) (opened ?r))  ; receptacle is opened if it is openable.
                    )
              )
            )
            (holds ?a ?o)
        )
    :effect
        (and
            (checked ?o)
        )
)

;; agent goes to receptacle
 (:action GotoLocation
    :parameters (?a - agent ?lStart - location ?lEnd - location ?r - receptacle)
    :precondition (and
                    (atLocation ?a ?lStart)
                    (receptacleAtLocation ?r ?lEnd)
                    ;(exists (?r - receptacle) (receptacleAtLocation ?r ?lEnd))
                  )
    :effect (and
                (not (atLocation ?a ?lStart))
                (atLocation ?a ?lEnd)
                ; (forall (?r - receptacle)
                ;     (when (and (receptacleAtLocation ?r ?lEnd)
                ;                (or (not (openable ?r)) (opened ?r)))
                ;         (checked ?r)
                ;     )
                ; )
                ; (increase (total-cost) (distance ?lStart ?lEnd))
            )
 )

;; agent opens receptacle
 (:action OpenObject
    :parameters (?a - agent ?l - location ?r - receptacle)
    :precondition (and
            (openable ?r)
            (atLocation ?a ?l)
            (receptacleAtLocation ?r ?l)
            (not (opened ?r))
            )
    :effect (and
                (opened ?r)
                (checked ?r)
            )
 )
;; agent closes receptacle
 (:action CloseObject
    :parameters (?a - agent ?l - location ?r - receptacle)
    :precondition (and
            (openable ?r)
            (atLocation ?a ?l)
            (receptacleAtLocation ?r ?l)
            (opened ?r)
            )
    :effect (and
                (not (opened ?r))
            )

 )

 ;; agent picks up object from a receptacle
 (:action PickupObject
    :parameters (?a - agent ?l - location ?o - obj ?r - receptacle)
    :precondition
        (and
            (pickupable ?o)
            (atLocation ?a ?l)
            (receptacleAtLocation ?r ?l)
            ; (objectAtLocation ?o ?l)
            (inReceptacle ?o ?r)
            (not (holdsAny ?a))  ; agent's hands are empty.
            ;(not (holdsAnyReceptacleObject ?a))
            (or (not (openable ?r)) (opened ?r))  ; receptacle is opened if it is openable.
            ;(not (isReceptacleObject ?o))
        )
    :effect
        (and
            (not (inReceptacle ?o ?r))
            (holds ?a ?o)
            (holdsAny ?a)
            (not (objectAtLocation ?o ?l))
            ;(not (full ?r))
        )
 )


; ;; agent picks up object from a receptacle
; (:action PickupObjectFromReceptacleObject
;    :parameters (?a - agent ?l - location ?o - object ?outerR - object ?r - receptacle)
;    :precondition
;        (and
;            (atLocation ?a ?l)
;            (receptacleAtLocation ?r ?l)
;            (inReceptacle ?o ?r)
;            (pickupable ?o)
;            (not (holdsAny ?a))  ; agent's hands are empty.
;            (not (holdsAnyReceptacleObject ?a))
;            (or (not (openable ?r)) (opened ?r))  ; receptacle is opened if it is openable.
;            (not (isReceptacleObject ?o))
;            (isReceptacleObject ?outerR)
;            (inReceptacleObject ?o ?outerR)
;        )
;    :effect
;        (and
;            (not (inReceptacle ?o ?r))
;            (holds ?a ?o)
;            (holdsAny ?a)
;            (not (objectAtLocation ?o ?l))
;            (not (full ?r))
;            (increase (total-cost) 1)
;
;            (not (inReceptacleObject ?o ?outerR))
;            (not (isReceptacleObjectFull ?outerR))
;        )
; )
;
; ;; agent picks up object from a receptacle
; (:action PickupEmptyReceptacleObject
;    :parameters (?a - agent ?l - location ?o - object ?r - receptacle)
;    :precondition
;        (and
;            (atLocation ?a ?l)
;            (receptacleAtLocation ?r ?l)
;            ; (objectAtLocation ?o ?l)
;            (inReceptacle ?o ?r)
;            (pickupable ?o)
;            (not (holdsAny ?a))  ; agent's hands are empty.
;            (not (holdsAnyReceptacleObject ?a))
;            (or (not (openable ?r)) (opened ?r))  ; receptacle is opened if it is openable.
;            (isReceptacleObject ?o)
;            (not (isReceptacleObjectFull ?o))
;        )
;    :effect
;        (and
;            (not (inReceptacle ?o ?r))
;            (holds ?a ?o)
;            (holdsAny ?a)
;            (not (objectAtLocation ?o ?l))
;            (not (full ?r))
;            (increase (total-cost) 1)
;            (holdsAnyReceptacleObject ?a)
;        )
; )
;
; ;; agent picks up object from a receptacle
; (:action PickupFullReceptacleObject
;    :parameters (?a - agent ?l - location ?o - object ?outerR - object ?r - receptacle)
;    :precondition
;        (and
;            (atLocation ?a ?l)
;            (receptacleAtLocation ?r ?l)
;            (inReceptacle ?outerR ?r)
;            (pickupable ?outerR)
;            (not (holdsAny ?a))  ; agent's hands are empty.
;            (not (holdsAnyReceptacleObject ?a))
;            (or (not (openable ?r)) (opened ?r))  ; receptacle is opened if it is openable.
;            (not (isReceptacleObject ?o))
;            (isReceptacleObject ?outerR)
;            (inReceptacleObject ?o ?outerR)
;        )
;    :effect
;        (and
;            (not (inReceptacle ?o ?r))
;            (not (inReceptacle ?outerR ?r))
;            (holds ?a ?outerR)
;            (holdsAny ?a)
;            (not (objectAtLocation ?o ?l))
;            (not (objectAtLocation ?outerR ?l))
;            (not (full ?r))
;            (increase (total-cost) 1)
;            (holdsAnyReceptacleObject ?a)
;        )
; )


;; agent puts down an object
 (:action PutObject
    :parameters (?a - agent ?l - location ?o - obj ?r - receptacle ?ot - otype ?rt - rtype)
    :precondition (and
            (holds ?a ?o)
            (atLocation ?a ?l)
            (receptacleAtLocation ?r ?l)
            (or (not (openable ?r)) (opened ?r))    ; receptacle is opened if it is openable
            ;(not (full ?r))
            (objectType ?o ?ot)
            (receptacleType ?r ?rt)
            (canContain ?rt ?ot)
            ;(not (holdsAnyReceptacleObject ?a))
            )
    :effect (and
                (inReceptacle ?o ?r)
                (objectAtLocation ?o ?l)
                ;(full ?r)
                (not (holds ?a ?o))
                (not (holdsAny ?a))
            )
 )

;;; agent puts down an object
; (:action PutObjectInReceptacleObject
;    :parameters (?a - agent ?l - location ?ot - otype ?o - object ?outerO - object ?outerR - receptacle)
;    :precondition (and
;            (atLocation ?a ?l)
;            (objectAtLocation ?outerO ?l)
;            (isReceptacleObject ?outerO)
;            (not (isReceptacleObject ?o))
;            (objectType ?o ?ot)
;            (holds ?a ?o)
;            (not (holdsAnyReceptacleObject ?a))
;            (inReceptacle ?outerO ?outerR)
;            (not (isReceptacleObjectFull ?outerO))
;            )
;    :effect (and
;                (inReceptacleObject ?o ?outerO)
;                (inReceptacle ?o ?outerR)
;                (not (holds ?a ?o))
;                (not (holdsAny ?a))
;                (objectAtLocation ?o ?l)
;                (isReceptacleObjectFull ?outerO)
;                (increase (total-cost) 1)
;            )
; )
;
;;; agent puts down an object
; (:action PutEmptyReceptacleObjectinReceptacle
;    :parameters (?a - agent ?l - location ?ot - otype ?o - object ?r - receptacle)
;    :precondition (and
;            (atLocation ?a ?l)
;            (receptacleAtLocation ?r ?l)
;            (or (not (openable ?r)) (opened ?r))    ; receptacle is opened if it is openable
;            (not (full ?r))
;            (objectType ?o ?ot)
;            (holds ?a ?o)
;            (holdsAnyReceptacleObject ?a)
;            (isReceptacleObject ?o)
;            (not (isReceptacleObjectFull ?o))
;            )
;    :effect (and
;                (inReceptacle ?o ?r)
;                (objectAtLocation ?o ?l)
;                (full ?r)
;                (not (holds ?a ?o))
;                (not (holdsAny ?a))
;                (not (holdsAnyReceptacleObject ?a))
;                (increase (total-cost) 1)
;            )
; )
;
;;; agent puts down a receptacle object in a receptacle
; (:action PutFullReceptacleObjectInReceptacle
;    :parameters (?a - agent ?l - location ?ot - otype ?innerO - object ?outerO - object ?r - receptacle) ; ?rt - rtype)
;    :precondition (and
;            (atLocation ?a ?l)
;            (receptacleAtLocation ?r ?l)
;            (objectType ?outerO ?ot)
;            (holds ?a ?outerO)
;            (holdsAnyReceptacleObject ?a)
;            (isReceptacleObject ?outerO)
;            (isReceptacleObjectFull ?outerO)
;            (inReceptacleObject ?innerO ?outerO)
;            )
;    :effect (and
;                (not (holdsAny ?a))
;                (not (holdsAnyReceptacleObject ?a))
;                (objectAtLocation ?outerO ?l)
;                (objectAtLocation ?innerO ?l)
;                (inReceptacle ?outerO ?r)
;                (inReceptacle ?innerO ?r)
;                (not (holds ?a ?outerO))
;                (increase (total-cost) 1)
;            )
; )

;; agent cleans some object
 (:action CleanObject
    :parameters (?a - agent ?l - location ?r - receptacle ?o - obj)
    :precondition (and
            (cleanable ?o)
            (or
                ;(receptacleType ?r SinkType)
                (receptacleType ?r SinkBasinType)
            )
            (atLocation ?a ?l)
            (receptacleAtLocation ?r ?l)
            (holds ?a ?o)
            )
    :effect (and
                (isClean ?o)
            )
 )


;; agent heats-up some object
 (:action HeatObject
    :parameters (?a - agent ?l - location ?r - receptacle ?o - obj)
    :precondition (and
            (heatable ?o)
            (or
                (receptacleType ?r MicrowaveType)
            )
            (atLocation ?a ?l)
            (receptacleAtLocation ?r ?l)
            (holds ?a ?o)
            )
    :effect (and
                (isHot ?o)
                (not (isCool ?o))
            )
 )

;; agent cools some object
 (:action CoolObject
    :parameters (?a - agent ?l - location ?r - receptacle ?o - obj)
    :precondition (and
            (coolable ?o)
            (or
                (receptacleType ?r FridgeType)
            )
            (atLocation ?a ?l)
            (receptacleAtLocation ?r ?l)
            (holds ?a ?o)
            )
    :effect (and
                (isCool ?o)
                (not (isHot ?o))
            )
 )


;; agent toggle object
 (:action ToggleObject
    :parameters (?a - agent ?l - location ?o - obj ?r - receptacle)
    :precondition (and
            (toggleable ?o)
            (atLocation ?a ?l)
            (receptacleAtLocation ?r ?l)
            (inReceptacle ?o ?r)
            )
    :effect (and
                (when (isOn ?o)
                    (not (isOn ?o)))
                (when (not (isOn ?o))
                    (isOn ?o))
                (isToggled ?o)
            )
 )


;; agent slices some object with a knife
 (:action SliceObject
    :parameters (?a - agent ?l - location ?co - obj ?ko - obj)
    :precondition
            (and
                (sliceable ?co)
                (or
                    (objectType ?ko KnifeType)
                    (objectType ?ko ButterKnifeType)
                )
                (atLocation ?a ?l)
                (objectAtLocation ?co ?l)
                (holds ?a ?ko)
            )
    :effect (and
                (isSliced ?co)
            )
 )


(:action help
    :parameters (?a - agent)
    :precondition
        ()
    :effect
        (and
            (checked ?a)
        )
)

)
