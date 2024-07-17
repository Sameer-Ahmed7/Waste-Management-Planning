(define (problem Waste_problem)
  (:domain Waste_domain)

  ;; Objects
  (:objects
  
    ;; Define Organic Dustbin, Plastic Dustbin, Paper Dustbin
    ;O_Bin_1A O_Bin_1B - organicBin
    ;PL_Bin_1A PL_Bin_1B - plasticBin
    ;PA_Bin_1A PA_Bin_B - paperBin 
    
    O_Bin_1A O_Bin_1B - organicBin
    PL_Bin_1A PL_Bin_1B - plasticBin
    PA_Bin_1A PA_Bin_1B - paperBin
    
    ;; Define Organic, Plastic, Paper City Dustbin
    O_CityBin_1 O_CityBin_2 - organicCityBin 
    PL_CityBin_1 PL_CityBin_2 - plasticCityBin
    PA_CityBin_1 PA_CityBin_2 - paperCityBin
    
    
    ;; Define Organic, Plastic, Paper Garbage
    Garbage_O_1A Garbage_O_2A Garbage_O_1B Garbage_O_2B Garbage_PL_1A Garbage_PL_2A Garbage_PL_1B Garbage_PL_2B  
    Garbage_PA_1A Garbage_PA_2A Garbage_PA_1B Garbage_PA_2B - garbageSubstance
    
    ;; Define Person1 Capacity
    P_Cap_1A P_Cap_1B - HumanCarry
    
    
    ;; Assign NewBag, Oldbag and Room _1 
    NewBag_O_1A NewBag_O_1B - newBag
    OldBag_O_1A OldBag_O_1B - oldBag
    NewBag_PA_1A NewBag_PA_1B - newBag
    OldBag_PA_1A OldBag_PA_1B - oldBag
    NewBag_PL_1A NewBag_PL_1B - newBag
    OldBag_PL_1A OldBag_PL_1B - oldBag
    
    room_1A room_1B - Room
    
    
    ;; Define Truck,Dumpyard
    truck_O truck_PL truck_PA - Truck
    dumpyard_O dumpyard_PL dumpyard_PA - Dumpyard
    
    
    ;; Define quantity
    n0 n1 n2 n3 - quantity
    
    ;; Define Location 
    R1A R1B O1A O1B PL1A PL1B PA1A PA1B B1A B1B I1A I1B OCB1 OCB2 PLCB1 PLCB2 PACB1 PACB2 OD1 PLD1 PAD1 - location  ; Existing locations from your code
    
    ;; Define Person 
    person_1A person_1B - Human
  )

  ;; Initial State
  (:init
    
    ;; Assign Person 1A Start Position
    (is_loc person_1A I1A) 
    
   
    ;; Assign Person 1B Start Position
    (is_loc person_1B I1B)
    
    ;; Assign Apartment-1 Organic, Plastic, Paper Dustbin Position
    (is_loc O_Bin_1A O1A)
    (is_loc PL_Bin_1A PL1A)
    (is_loc PA_Bin_1A PA1A)
    
    
    ;; Assign Apartment-2 Organic, Plastic, Paper Dustbin Position
    (is_loc O_Bin_1B O1B)
    (is_loc PL_Bin_1B PL1B)
    (is_loc PA_Bin_1B PA1B)
    
    ;; Assign Apartment-1 Organic, Plastic, Paper Newbag Position 
    (is_loc NewBag_O_1A B1A)
    (is_loc NewBag_PL_1A B1A)
    (is_loc NewBag_PA_1A B1A)
    
    
    ;; Assign Apartment-2 Organic, Plastic, Paper Newbag Position 
    (is_loc NewBag_O_1B B1B)
    (is_loc NewBag_PL_1B B1B)
    (is_loc NewBag_PA_1B B1B)
    
    
    ;; Assign Apartment-1 Room Position
    (is_loc room_1A R1A)
    
    
    ;; Assign Apartment-2 Room Position
    (is_loc room_1B R1B)
    
    ;; Assign Apartment-1 Organic, Plastic, Paper Garbage Position
   (is_loc Garbage_O_1A R1A)
   (is_loc Garbage_O_2A R1A)
   
   (is_loc Garbage_PL_1A R1A)
   (is_loc Garbage_PL_2A R1A)
   
   (is_loc Garbage_PA_1A R1A)
   (is_loc Garbage_PA_2A R1A)
   
   
   
   ;; Assign Apartment-2 Organic, Plastic, Paper Garbage Position
   (is_loc Garbage_O_1B R1B)
   (is_loc Garbage_O_2B R1B)
   
   (is_loc Garbage_PL_1B R1B)
   (is_loc Garbage_PL_2B R1B)
   
   (is_loc Garbage_PA_1B R1B)
   (is_loc Garbage_PA_2B R1B)

    ;; Assign CityBin 1 for Apartment-1, Apartment-2 pOrganic, Plastic, Paper CityDustbins Position
    (is_loc O_CityBin_1 OCB1)
    (is_loc PL_CityBin_1 PLCB1)
    (is_loc PA_CityBin_1 PACB1)
    
    ;; Assign CityBin 2 for Apartment-3 pOrganic, Plastic, Paper CityDustbins Position
    (is_loc O_CityBin_2 OCB2)
    (is_loc PL_CityBin_2 PLCB2)
    (is_loc PA_CityBin_2 PACB2)
    
    
    ;; Assign Organic, Plastic, Paper Dumpyard and truck Position (Both same)
    (is_loc truck_O OD1)
    (is_loc dumpyard_O OD1)
    
    (is_loc truck_PL PLD1)
    (is_loc dumpyard_PL PLD1)
    
    (is_loc truck_PA PAD1)
    (is_loc dumpyard_PA PAD1)
    
    
    ;; Assign Apartment-1 Organic, Plastic, Paper Dustbin Level
    (bin_clear O_Bin_1A)
    (bin_clear PL_Bin_1A)
    (bin_clear PA_Bin_1A)
    

    ;; Assign Apartment-3 Organic, Plastic, Paper Dustbin Level
    (bin_clear O_Bin_1B)
    (bin_clear PL_Bin_1B)
    (bin_clear PA_Bin_1B)

    
    ;; Assign 1st Appartments Related Things (Organic)
    
    (related person_1A P_Cap_1A)
    
    (related person_1A O_Bin_1A)
    
    (related person_1A O_CityBin_1)

    (related person_1A room_1A)
    
    (related O_Bin_1A NewBag_O_1A)

    (related O_Bin_1A OldBag_O_1A)
    
    
    (related O_Bin_1A Garbage_O_1A)
    (related O_Bin_1A Garbage_O_2A)
    
    (related O_CityBin_1 O_Bin_1A)
    
    (related truck_O O_CityBin_1)
    
    (related dumpyard_O truck_O)
    
    
    ;; Assign 1st Appartments Related Things (Plastic)
    

    (related person_1A PL_Bin_1A)
    
    (related person_1A PL_CityBin_1)

    
    (related PL_Bin_1A NewBag_PL_1A)

    (related PL_Bin_1A OldBag_PL_1A)
    
    
    (related PL_Bin_1A Garbage_PL_1A)
    (related PL_Bin_1A Garbage_PL_2A)
    
    (related PL_CityBin_1 PL_Bin_1A)
    
    (related truck_PL PL_CityBin_1)
    
    (related dumpyard_PL truck_PL)
    
    ;; Assign 1st Appartments Related Things (Paper)
    
    (related person_1A PA_Bin_1A)
    
    (related person_1A PA_CityBin_1)

    
    (related PA_Bin_1A NewBag_PA_1A)

    (related PA_Bin_1A OldBag_PA_1A)
    
    
    (related PA_Bin_1A Garbage_PA_1A)
    (related PA_Bin_1A Garbage_PA_2A)
    
    (related PA_CityBin_1 PA_Bin_1A)
    
    (related truck_PA PA_CityBin_1)
    
    (related dumpyard_PA truck_PA)
    
    
    
    
    
    
    ;; Assign 2nd Appartments Related Things (Organic)
    
    (related person_1B P_Cap_1B)
    
    (related person_1B O_Bin_1B)
    
    (related person_1B O_CityBin_2)

    (related person_1B room_1B)
    
    (related O_Bin_1B NewBag_O_1B)

    (related O_Bin_1B OldBag_O_1B)
    
    
    (related O_Bin_1B Garbage_O_1B)
    (related O_Bin_1B Garbage_O_2B)
    
    (related O_CityBin_2 O_Bin_1B)
    
    (related truck_O O_CityBin_2)
    

    
    
    ;; Assign 2nd Appartments Related Things (Plastic)
    

    (related person_1B PL_Bin_1B)
    
    (related person_1B PL_CityBin_2)

    
    (related PL_Bin_1B NewBag_PL_1B)

    (related PL_Bin_1B OldBag_PL_1B)
    
    
    (related PL_Bin_1B Garbage_PL_1B)
    (related PL_Bin_1B Garbage_PL_2B)
    
    (related PL_CityBin_2 PL_Bin_1B)
    
    (related truck_PL PL_CityBin_2)

    
    ;; Assign 3rd Appartments Related Things (Paper)
    
    (related person_1B PA_Bin_1B)
    
    (related person_1B PA_CityBin_2)

    
    (related PA_Bin_1B NewBag_PA_1B)

    (related PA_Bin_1B OldBag_PA_1B)
    
    
    (related PA_Bin_1B Garbage_PA_1B)
    (related PA_Bin_1B Garbage_PA_2B)
    
    (related PA_CityBin_2 PA_Bin_1B)
    
    (related truck_PA PA_CityBin_2)
    

    ;; Assign Apartment-1 Person Capacity 
    (person_hands_empty P_Cap_1A)
    

    
    ;; Assign Apartment-2 Person Capacity 
    (person_hands_empty P_Cap_1B)
    
    ;; Starting Truck Limit (N1 means 1 citybin garbage taken Capacity)
    (Truck_capacity truck_O n2)
    (Truck_capacity truck_PL n2)
    (Truck_capacity truck_PA n2)
    
    ;; Increment (Values)
    (plus1 n0 n1)
    (plus1 n1 n2)
    (plus1 n2 n3)
    
    ;; Truck Move to Dumpyard when Between n0-n1 Capacity
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
    
    
    ;; Old_Bag_Dumb (CityBins limit) It is feasible when truck come it depends upon only this when it full it will come
    (old_bag_dumb O_CityBin_2 n1)
    (old_bag_dumb PL_CityBin_2 n1)
    (old_bag_dumb PA_CityBin_2 n1)
    
    ;; Truck Will Come on this limit
    (between O_CityBin_2 n0 n1)
    (between PL_CityBin_2 n0 n1)
    (between PA_CityBin_2 n0 n1)
    
    ;(= (distance OD1 OD1) 0) ; Oranic Dumpyard
    ;(= (distance PLD1 PLD1) 0) ; Paper Dumpyard
    ;(= (distance PAD1 PAD1) 0) ; Plastic Dumpyard
    
    ;(= (distance OCB1 OCB1) 0) ; Organic City Bin 1
    ;(= (distance PLCB1 PLCB1) 0) ; Paper City Bin 1
    ;(= (distance PACB1 PACB1) 0) ; Plastic City Bin 1
    
    ;(= (distance OCB2 OCB2) 0) ; Organic City Bin 2
    ;(= (distance PLCB2 PLCB2) 0) ; Paper City Bin 2
    ;(= (distance PACB2 PACB2) 0) ; Plastic City Bin 2

    ;(= (distance OD1 OCB2) 1) ; Organic Dumpyard to Organic City Bin 2
    ;(= (distance OCB2 OCB1) 1) ; Organic City Bin 2 to Organic City Bin 1
    ;(= (distance OCB1 OD1) 1) ; Organic City Bin 1 to Organic Dumpyard
    
    ;(= (distance PAD1 PACB2) 1) ; Paper Dumpyard to Paper City Bin 2
    ;(= (distance PACB2 PACB1) 1) ; Paper City Bin 2 to Paper City Bin 1
    ;(= (distance PACB1 PAD1) 1) ; Paper City Bin 1 to Paper Dumpyard
    
    ;(= (distance PLD1 PLCB2) 1) ; Paper Dumpyard to Paper City Bin 2
    ;(= (distance PLCB2 PLCB1) 1) ; Paper City Bin 2 to Paper City Bin 1
    ;(= (distance PLCB1 PLD1) 1) ; Paper City Bin 1 to Paper Dumpyard
    
    
    
    
    
    
    ;(= (distance OD1 OCB1) 20) ; Organic Dumpyard to Organic City Bin 1
    ;(= (distance OCB1 OCB2) 20) ; Organic City Bin 1 to Organic City Bin 2
    ;(= (distance OCB2 OD1) 20) ; Organic City Bin 2 to Organic Dumpyard
    
    ;(= (distance PAD1 PACB1) 20) ; Paper Dumpyard to Paper City Bin 1
    ;(= (distance PACB1 PACB2) 20) ; Paper City Bin 1 to Paper City Bin 2
    ;(= (distance PACB2 PAD1) 20) ; Paper City Bin 2 to Paper Dumpyard
    
    ;(= (distance PLD1 PLCB1) 20) ; Paper Dumpyard to Paper City Bin 1
    ;(= (distance PLCB1 PLCB2) 20) ; Paper City Bin 1 to Paper City Bin 2
    ;(= (distance PLCB2 PLD1) 20) ; Paper City Bin 2 to Paper Dumpyard



    (= (total-cost) 0)
    
    
     
  )

  ;; Goal State
  (:goal
    (and 
    
    ;; Apartment-1 Goal 
    	 (garbage_in_bin Garbage_O_1A O_Bin_1A)
    	 (garbage_in_bin Garbage_O_2A O_Bin_1A)
    	 
    	
    	 
    	 (garbage_in_bin Garbage_PL_1A PL_Bin_1A)
    	 (garbage_in_bin Garbage_PL_2A PL_Bin_1A)
    	 
    	 
    	 
    	 (garbage_in_bin Garbage_PA_1A PA_Bin_1A)
    	 (garbage_in_bin Garbage_PA_2A PA_Bin_1A)
    	 
    	 
    	 (is_loc person_1A I1A)
    	 

    	 
   ;; Apartment-2 Goal
   
        (garbage_in_bin Garbage_O_1B O_Bin_1B)
    	 (garbage_in_bin Garbage_O_2B O_Bin_1B)
    	 	 
    	 (garbage_in_bin Garbage_PL_1B PL_Bin_1B)
    	 (garbage_in_bin Garbage_PL_2B PL_Bin_1B)
    	 
    	 
    	 (garbage_in_bin Garbage_PA_1B PA_Bin_1B)
    	 (garbage_in_bin Garbage_PA_2B PA_Bin_1B)
    	 
    	 
    	 (is_loc person_1B I1B)
    	 
    	 (deposited_bin_garbage O_Bin_1A)
    	 (deposited_bin_garbage PA_Bin_1A)
    	 (deposited_bin_garbage PL_Bin_1A)
 
    	 
    	 (deposited_bin_garbage O_Bin_1B)
    	 (deposited_bin_garbage PA_Bin_1B)
    	 (deposited_bin_garbage PL_Bin_1B)
    	 
    	 
    	 (collected_cityBins_garbage O_CityBin_1 truck_O)
    	 (collected_cityBins_garbage PA_CityBin_1 truck_PA)
    	 (collected_cityBins_garbage PL_CityBin_1 truck_PL)
    	 
    	 (collected_cityBins_garbage O_CityBin_2 truck_O)
    	 (collected_cityBins_garbage PA_CityBin_2 truck_PA)
    	 (collected_cityBins_garbage PL_CityBin_2 truck_PL)
    	
    	
    	(disposed_cityBins_garbage truck_O)
    	(disposed_cityBins_garbage truck_PL)
        (disposed_cityBins_garbage truck_PA)
    	
    	 ) 
  )
  
  
  (:metric minimize (total-cost))
)
