(define (problem Waste_problem)
  (:domain Waste_domain)

  ;; Objects
  (:objects
    organic_bin - organicBin
    paper_bin - paperBin
    plastic_bin - plasticBin
    
    organic_city_Bin - organicCityBin 
    paper_city_Bin - paperCityBin 
    plastic_city_Bin - plasticCityBin
    
    
    organic_1 plastic_1 paper_1 organic_2 plastic_2 paper_2 organic_3 plastic_3 paper_3 - garbageSubstance
    personCapacity - HumanCarry
    
    NewBag - newBag
    OldBag - oldBag
    room - Room
    
    truck_organic - Truck
    time - Time
    
    n1 n2 n3 n4 n5 n6 n7 n8 n9
    n10 n11 n12 n13 n14 n15 n16 n17 n18 n19
    n20 n21 n22 n23 n24 - Time
    
    dumpyard_organic - Dumpyard
    
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_12 - location  ; Existing locations from your code
    person - Human
  )

  ;; Initial State
  (:init
    
    (is_loc person pos_1) 
    (is_loc paper_bin pos_2)
    (is_loc plastic_bin pos_3)
    (is_loc organic_bin pos_4)
    (is_loc NewBag pos_5)
    (is_loc room pos_6)
    (is_loc organic_1 pos_6)
    (is_loc paper_city_Bin pos_7)
    (is_loc plastic_city_Bin pos_8)
    (is_loc organic_city_Bin pos_9)
    
    
    (is_loc paper_1 pos_6)
    ;(is_loc plastic_1 pos_6)
    
    (is_loc truck_organic pos_12)
    (is_loc dumpyard_organic pos_12)
    
    ;(bin_half paper_bin)
    ;(bin_half plastic_bin)
    (bin_full organic_bin)
    
    
    (related organic_bin organic_1)
    ;(related paper_bin paper_1)
    ;(related plastic_bin plastic_1)
    
    (related organic_city_Bin organic_bin)
    ;(related paper_city_Bin paper_bin)
    ;(related plastic_city_Bin plastic_bin)
    
    (related truck_organic organic_city_bin)
    (related dumpyard_organic truck_organic)
    
    
    (is_morning time)
    
    
    (person_hands_empty personCapacity)
    
    
    ;; Starting Time 
    (Time_capacity n1)
    
    ;; Time Increase n1 means (1 AM)
    (plus1 n1 n2)
    (plus1 n2 n3)
    (plus1 n3 n4)
    (plus1 n4 n5)
    (plus1 n5 n6)
    (plus1 n6 n7)
    (plus1 n7 n8)
    (plus1 n8 n9)
    (plus1 n9 n10)
    (plus1 n10 n11)
    (plus1 n11 n12)
    (plus1 n12 n13)
    (plus1 n13 n14)
    (plus1 n14 n15)
    (plus1 n15 n16)
    (plus1 n16 n17)
    (plus1 n17 n18)
    (plus1 n18 n19)
    (plus1 n19 n20)
    (plus1 n20 n21)
    (plus1 n21 n22)
    (plus1 n22 n23)
    (plus1 n23 n24)
    
    
    ;; Bewtween Means I decided (Morning Time For Oraganic 7:Am to 12:00 PM)
    ;(between truck_organic n7 n12)
    ;(between truck_organic n8 n12)
    ;(between truck_organic n9 n12)
    ;(between truck_organic n10 n12)
    (between truck_organic n11 n13)
    (between truck_organic n12 n13)
    
    (= (total-cost) 0)
    
    
     
  )

  ;; Goal State
  (:goal
    (and 
    	 ;(is_loc person pos_4)
    	 ;(Time_capacity n10)
    	 
    	 
    	 ;(is_loc person pos_1)
    	 (garbage_in_bin organic_1 organic_bin)
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
