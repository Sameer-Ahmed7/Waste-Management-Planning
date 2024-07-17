(define (problem Waste_problem)
  (:domain Waste_domain)

  ;; Objects
  (:objects
  
    ;; Assign Apartments Dustbins _1 (Means 1st Apartment)
    organic_bin_1 organic_bin_2 - organicBin
    paper_bin_1 paper_bin_2 - paperBin
    plastic_bin_1 plastic_bin_2 - plasticBin
    
    
    ;; Assign CityBins _1 (Means 1st Apartment Front CityDustbins)
    organic_city_Bin_1 organic_city_Bin_2 - organicCityBin 
    paper_city_Bin_1 paper_city_Bin_2 - paperCityBin 
    plastic_city_Bin_1 plastic_city_Bin_2 - plasticCityBin
    
    
    ;; Assign Substance Bags _1 (Means 1st Apartments)
    organic_1 plastic_1 paper_1 organic_2 plastic_2 paper_2 organic_3 plastic_3 paper_3 - garbageSubstance
    
    ;; Assign PersonCapacity _1 (Means 1st Apartment's Person)
    person_1_Capacity person_2_Capacity - HumanCarry
    
    
    ;; Assign NewBag, Oldbag and Room _1 
    NewBag_1  NewBag_2 - newBag
    OldBag_1 OldBag_2 - oldBag
    room_1 room_2 - Room
    
    
    ;; Assign Truck, Time and Dumpyard
    truck_organic - Truck
    time - Time
    dumpyard_organic - Dumpyard
    
    
    ;; Assign Location 
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10 pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19 pos_20 pos_21 - location  ; Existing locations from your code
    
    ;; Assign Person's (Means 1st Apartment's Person Capacity)
    person_1 person_2 - Human
  )

  ;; Initial State
  (:init
    
    ;; Assign Person Start Position
    (is_loc person_1 pos_1) 
    (is_loc person_2 pos_10) 
    
    ;; Assign 1st Appartment Dustbin Position
    (is_loc paper_bin_1 pos_2)
    (is_loc plastic_bin_1 pos_3)
    (is_loc organic_bin_1 pos_4)
    
    
    ;; Assign 2nd Appartment Dustbin Position
    (is_loc paper_bin_2 pos_11)
    (is_loc plastic_bin_2 pos_12)
    (is_loc organic_bin_2 pos_13)
    
    
    ;; Assign 1st Apartment Newbag Position 
    (is_loc NewBag_1 pos_5)
    
    ;; Assign 2nd Apartment Newbag Position 
    (is_loc NewBag_2 pos_14)
    
    
    ;; Assign 1st Apartment Room Position
    (is_loc room_1 pos_6)
    
    ;; Assign 2nd Apartment Room Position
    (is_loc room_2 pos_15)
    
    
    
    ;; Assign 1st Apartment Garbage Position
   (is_loc organic_1 pos_6)
     ;(is_loc paper_1 pos_6)
    ;(is_loc plastic_1 pos_6)
    
    ;; Assign 2nd Apartment Garbage Position
   (is_loc organic_2 pos_15)
    
    
    ;; Assign 1st Apartment CityDustbins
    (is_loc paper_city_Bin_1 pos_7)
    (is_loc plastic_city_Bin_1 pos_8)
    (is_loc organic_city_Bin_1 pos_9)
    
    
    ;; Assign 2nd Apartment CityDustbins
    (is_loc paper_city_Bin_2 pos_16)
    (is_loc plastic_city_Bin_2 pos_17)
    (is_loc organic_city_Bin_2 pos_18)
    
    
    ;(is_loc paper_1 pos_6)
    ;(is_loc plastic_1 pos_6)
    
    
    ;; Assign Truck Dumpyard Position
    (is_loc truck_organic pos_21)
    (is_loc dumpyard_organic pos_21)
    
    
    ;; Assign 1st Appartments Dustbin Level
    (bin_half paper_bin_1)
    (bin_half plastic_bin_1)
    (bin_full organic_bin_1)
    
    
    ;; Assign 2nd Appartments Dustbin Level
    (bin_half paper_bin_2)
    (bin_half plastic_bin_2)
    (bin_full organic_bin_2)
    
    
    ;; Assign 1st Appartments Related Things
    
    (related person_1 person_1_Capacity)
    
    (related person_1 organic_bin_1)
    (related person_1 paper_bin_1)
    (related person_1 plastic_bin_1)
    
    (related person_1 organic_city_Bin_1)
    (related person_1 paper_city_Bin_1)
    (related person_1 plastic_city_Bin_1)
    
    (related person_1 room_1)
    
    (related person_1 NewBag_1)
    (related person_1 OldBag_1)
    
    
    (related organic_bin_1 organic_1)
    (related paper_bin_1 paper_1)
    (related plastic_bin_1 plastic_1)
    
    (related organic_city_Bin_1 organic_bin_1)
    (related paper_city_Bin_1 paper_bin_1)
    (related plastic_city_Bin_1 plastic_bin_1)
    
    (related truck_organic organic_city_Bin_1)
    (related truck_organic organic_city_Bin_2)
    
    (related dumpyard_organic truck_organic)
    
    
    ;; Assign 2nd Appartments Related Things
    
    (related person_2 person_2_Capacity)
    
    (related person_2 organic_bin_2)
    (related person_2 paper_bin_2)
    (related person_2 plastic_bin_2)
    
    (related person_2 organic_city_Bin_2)
    (related person_2 paper_city_Bin_2)
    (related person_2 plastic_city_Bin_2)
    
    (related person_2 room_2)
    
    (related person_2 NewBag_2)
    (related person_2 OldBag_2)
    
    (related organic_bin_2 organic_2)
    (related paper_bin_2 paper_2)
    (related plastic_bin_2 plastic_2)
    
    (related organic_city_Bin_2 organic_bin_2)
    (related paper_city_Bin_2 paper_bin_2)
    (related plastic_city_Bin_2 plastic_bin_2)
    
    
    ;; Define Time Now
    (is_morning time)
    
    
    ;; Assign Person Capacity 
    (person_hands_empty person_1_Capacity)
    (person_hands_empty person_2_Capacity)
    
    (= (total-cost) 0)
    
    
     
  )

  ;; Goal State
  (:goal
    (and 
    	
    	 (garbage_in_bin organic_1 organic_bin_1)
    	 (garbage_in_bin organic_2 organic_bin_2)
    	 (disposed_cityBins_garbage truck_organic)
    	 ;(old_bag_dumb organic_bin)
    	 
    	 ;(garbage_in_bin paper_1 paper_bin)
    	 ;(old_bag_dumb paper_bin)
    	 
    	 ;(garbage_in_bin plastic_1 plastic_bin)
    	 ;(old_bag_dumb plastic_bin)
    	 
    	 ;(garbage_in_bin organic_2 organic_bin)
    	 ;(garbage_in_bin organic_3 organic_bin)
    	
    	 ) ; Waste should be at location pos_4
  )
  
  
  (:metric minimize (total-cost))
)
