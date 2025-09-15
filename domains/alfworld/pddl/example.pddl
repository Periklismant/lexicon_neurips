
(define (problem plan_trial_T20190907_043708_054006)
(:domain alfred)
(:objects
        agent1 - agent
        BoxType - otype
        BookType - otype
        SofaType - rtype
        ArmChairType - rtype


        Book - obj
        Box - obj
        ArmChair - receptacle
        Sofa - receptacle
        loc1 - location
        loc2 - location
        loc3 - location
        loc4 - location
        loc5 - location
        )
    

(:init


        (receptacleType ArmChair ArmChairType)
        (receptacleType Sofa SofaType)
        (objectType Box BoxType)
        (objectType Book BookType)
        (canContain SofaType BoxType)
        (canContain SofaType BookType)
        (canContain ArmChairType BoxType)
        (canContain ArmChairType BoxType)
        (pickupable Box)
        (pickupable Book)
        (isReceptacleObject Box)
        
        
        (atLocation agent1 loc1)
        
        (inReceptacle Book ArmChair)
        (inReceptacle Box Sofa)
        
        
        (receptacleAtLocation ArmChair loc5)
        (receptacleAtLocation Sofa loc3)
        (objectAtLocation Box loc3)
        (objectAtLocation Book loc5)
        )
    

        (:goal
            (and
                (exists (?r - receptacle)
                    (exists (?o - obj)
                        (and
                            (inReceptacle ?o ?r)
                            (objectType ?o BookType)
                            (receptacleType ?r SofaType)
                        )
                    )
                )
            )
        )
    )
    
