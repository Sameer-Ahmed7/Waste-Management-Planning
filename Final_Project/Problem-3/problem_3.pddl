(define (problem Waste_problem)
  (:domain Waste_domain)

  ;; Objects
  (:objects
  
    ;; Define Organic Dustbin, Plastic Dustbin, Paper Dustbin
    O_Bin_1 - organicBin
    PL_Bin_1 - plasticBin
    PA_Bin_1 - paperBin 
    
    ;; Define Organic, Plastic, Paper City Dustbin
    O_CityBin_1 - organicCityBin 
    PL_CityBin_1 - plasticCityBin
    PA_CityBin_1 - paperCityBin
    
    
    ;; Define Organic, Plastic, Paper Garbage
    Garbage_O_1A Garbage_O_2A Garbage_PL_1A Garbage_PL_2A Garbage_PA_1A Garbage_PA_2A - garbageSubstance
    
    ;; Define Person1 Capacity
    P_Cap_1 - HumanCarry
    
    
    ;; Assign NewBag, Oldbag and Room _1 
    NewBag_O_1 - newBag
    OldBag_O_1 - oldBag
    NewBag_PA_1 - newBag
    OldBag_PA_1 - oldBag
    NewBag_PL_1 - newBag
    OldBag_PL_1 - oldBag
    
    room_1 - Room
    
    
    ;; Define Truck,Dumpyard
    truck_O truck_PL truck_PA - Truck
    dumpyard_O dumpyard_PL dumpyard_PA - Dumpyard
    
    
    ;; Define quantity
    n0 n1 - quantity
    
    ;; Define Location 
    R1 O1 PL1 PA1 B1 I1 OCB1 PLCB1 PACB1 OD1 PLD1 PAD1 - location  ; Existing locations from your code
    
    ;; Define Person 
    person_1 - Human
  )

  ;; Initial State
  (:init
    
    ;; Assign Person Start Position
    (is_loc person_1 I1) 
    
    ;; Assign Organic, Plastic, Paper Dustbin Position
    (is_loc O_Bin_1 O1)
    (is_loc PL_Bin_1 PL1)
    (is_loc PA_Bin_1 PA1)
    
    ;; Assign Organic, Plastic, Paper Newbag Position 
    (is_loc NewBag_O_1 B1)
    (is_loc NewBag_PL_1 B1)
    (is_loc NewBag_PA_1 B1)
    
    
    ;; Assign Room Position
    (is_loc room_1 R1)
    
    ;; Assign Organic, Plastic, Paper Garbage Position
   (is_loc Garbage_O_1A R1)
   (is_loc Garbage_O_2A R1)
   
   (is_loc Garbage_PL_1A R1)
   (is_loc Garbage_PL_2A R1)
   
   (is_loc Garbage_PA_1A R1)
   (is_loc Garbage_PA_2A R1)

    ;; Assign Organic, Plastic, Paper CityDustbins Position
    (is_loc O_CityBin_1 OCB1)
    (is_loc PL_CityBin_1 PLCB1)
    (is_loc PA_CityBin_1 PACB1)
    
    
    ;; Assign Organic, Plastic, Paper Dumpyard and truck Position (Both same)
    (is_loc truck_O OD1)
    (is_loc dumpyard_O OD1)
    
    (is_loc truck_PL PLD1)
    (is_loc dumpyard_PL PLD1)
    
    (is_loc truck_PA PAD1)
    (is_loc dumpyard_PA PAD1)
    
    
    ;; Assign Organic, Plastic, Paper Dustbin Level
    (bin_clear O_Bin_1)
    (bin_clear PL_Bin_1)
    (bin_clear PA_Bin_1)

    
    ;; Assign 1st Appartments Related Things (Organic)
    
    (related person_1 P_Cap_1)
    
    (related person_1 O_Bin_1)
    
    (related person_1 O_CityBin_1)

    (related person_1 room_1)
    
    (related O_Bin_1 NewBag_O_1)

    (related O_Bin_1 OldBag_O_1)
    
    
    (related O_Bin_1 Garbage_O_1A)
    (related O_Bin_1 Garbage_O_2A)
    
    (related O_CityBin_1 O_Bin_1)
    
    (related truck_O O_CityBin_1)
    
    (related dumpyard_O truck_O)
    
    
    ;; Assign 1st Appartments Related Things (Plastic)
    

    (related person_1 PL_Bin_1)
    
    (related person_1 PL_CityBin_1)

    
    (related PL_Bin_1 NewBag_PL_1)

    (related PL_Bin_1 OldBag_PL_1)
    
    
    (related PL_Bin_1 Garbage_PL_1A)
    (related PL_Bin_1 Garbage_PL_2A)
    
    (related PL_CityBin_1 PL_Bin_1)
    
    (related truck_PL PL_CityBin_1)
    
    (related dumpyard_PL truck_PL)
    
    ;; Assign 1st Appartments Related Things (Paper)
    
    (related person_1 PA_Bin_1)
    
    (related person_1 PA_CityBin_1)

    
    (related PA_Bin_1 NewBag_PA_1)

    (related PA_Bin_1 OldBag_PA_1)
    
    
    (related PA_Bin_1 Garbage_PA_1A)
    (related PA_Bin_1 Garbage_PA_2A)
    
    (related PA_CityBin_1 PA_Bin_1)
    
    (related truck_PA PA_CityBin_1)
    
    (related dumpyard_PA truck_PA)
    

    ;; Assign Person Capacity 
    (person_hands_empty P_Cap_1)
    
    ;; Starting Truck Limit (N1 means 1 citybin garbage taken Capacity)
    (Truck_capacity truck_O n1)
    (Truck_capacity truck_PL n1)
    (Truck_capacity truck_PA n1)
    
    ;; Increment (Values)
    (plus1 n0 n1)
    
    ;; Move Truck Between n0-n1 Capacity
    (between truck_O n0 n1)
    (between truck_PL n0 n1)
    (between truck_PA n0 n1)
    
    ;; Old_Bag_Dumb (CityBins limit) It is feasible when truck come it depends upon only this when it full it will come
    (old_bag_dumb O_CityBin_1 n1)
    (old_bag_dumb PL_CityBin_1 n1)
    (old_bag_dumb PA_CityBin_1 n1)
    
    ;; Truck Will Come on this limit
    (between O_CityBin_1 n0 n1)
    (between PL_CityBin_1 n0 n1)
    (between PA_CityBin_1 n0 n1)
    
    (= (total-cost) 0)
    
    
     
  )

  ;; Goal State
  (:goal
    (and 
    	 (garbage_in_bin Garbage_O_1A O_Bin_1)
    	 (garbage_in_bin Garbage_O_2A O_Bin_1)
    	 
    	 (disposed_cityBins_garbage truck_O)
    	 
    	 (deposited_bin_garbage O_Bin_1)
    	 
    	 (collected_cityBins_garbage O_CityBin_1 truck_O)
    	 
    	 
    	 
    	 
    	 (garbage_in_bin Garbage_PL_1A PL_Bin_1)
    	 (garbage_in_bin Garbage_PL_2A PL_Bin_1)
    	 
    	 (disposed_cityBins_garbage truck_PL)
    	 
    	 
    	 (deposited_bin_garbage PL_Bin_1)
    	 
    	 (collected_cityBins_garbage PL_CityBin_1 truck_PL)
    	 
    	 
    	 
    	 
    	 
    	 (garbage_in_bin Garbage_PA_1A PA_Bin_1)
    	 (garbage_in_bin Garbage_PA_2A PA_Bin_1)
    	 
    	 (disposed_cityBins_garbage truck_PA)
    	 
    	 (deposited_bin_garbage PA_Bin_1)
    	 
    	 (collected_cityBins_garbage PA_CityBin_1 truck_PA)
    	 
    	 
    	 
    	 
    	 (is_loc person_1 I1)
    	
    	 ) 
  )
  
  
  (:metric minimize (total-cost))
)