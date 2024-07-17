(define (problem Waste_problem)
  (:domain Waste_domain)

  ;; Objects
  (:objects
  
    ;; Define Organic Dustbin
    O_Bin_1 - organicBin
    
    ;; Define Organic City Dustbin
    O_CityBin_1 - organicCityBin 
    
    ;; Define Organic Garbage
    Garbage_O_1  - garbageSubstance
    
    ;; Define Person1 Capacity
    P_Cap_1 - HumanCarry
    
    
    ;; Assign NewBag, Oldbag and Room _1 
    NewBag_O_1 - newBag
    OldBag_O_1 - oldBag
    room_1 - Room
    
    
    ;; Define Truck,Dumpyard
    truck_O - Truck
    dumpyard_O - Dumpyard
    
    
    ;; Define quantity
    n0 n1 - quantity
    
    ;; Define Location 
    R1 O1 B1 I1 OCB1 OD1 - location  ; Existing locations from your code
    
    ;; Define Person 
    person_1 - Human
  )

  ;; Initial State
  (:init
    
    ;; Assign Person Start Position
    (is_loc person_1 I1) 
    
    ;; Assign Organic Dustbin Position
    (is_loc O_Bin_1 O1)
    
    ;; Assign Newbag Position 
    (is_loc NewBag_O_1 B1)
    
    
    ;; Assign Room Position
    (is_loc room_1 R1)
    
    ;; Assign Organic Garbage Position
   (is_loc Garbage_O_1 R1)

    ;; Assign Organic CityDustbins Position
    (is_loc O_CityBin_1 OCB1)
    
    
    ;; Assign Organic Dumpyard and truck Position (Both same)
    (is_loc truck_O OD1)
    (is_loc dumpyard_O OD1)
    
    
    ;; Assign Organic Dustbin Level
    (bin_half O_Bin_1)

    
    ;; Assign 1st Appartments Related Things
    
    (related person_1 P_Cap_1)
    
    (related person_1 O_Bin_1)
    
    (related person_1 O_CityBin_1)

    (related person_1 room_1)
    
    (related O_Bin_1 NewBag_O_1)

    (related O_Bin_1 OldBag_O_1)
    
    
    (related O_Bin_1 Garbage_O_1)
    
    (related O_CityBin_1 O_Bin_1)
    
    (related truck_O O_CityBin_1)
    
    (related dumpyard_O truck_O)
    

    ;; Assign Person Capacity 
    (person_hands_empty P_Cap_1)
    
    ;; Starting Truck Limit (N1 means 1 citybin garbage taken Capacity)
    (Truck_capacity truck_O n1)
    
    ;; Increment (Values)
    (plus1 n0 n1)
    
    ;; Move Truck Between n0-n1 Capacity
    (between truck_O n0 n1)
    
    ;; Old_Bag_Dumb (CityBins limit) It is feasible when truck come it depends upon only this when it full it will come
    (old_bag_dumb O_CityBin_1 n1)
    
    ;; Truck Will Come on this limit
    (between O_CityBin_1 n0 n1)
    
    (= (total-cost) 0)
    
    
     
  )

  ;; Goal State
  (:goal
    (and 
    	 (garbage_in_bin Garbage_O_1 O_Bin_1)
    	 
    	 (disposed_cityBins_garbage truck_O)
    	 
    	 (is_loc person_1 I1)
    	
    	 ) 
  )
  
  
  (:metric minimize (total-cost))
)
