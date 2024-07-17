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
    
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 - location  ; Existing locations from your code
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
    (is_loc plastic_1 pos_6)
    
    
    
    (bin_half paper_bin)
    (bin_half plastic_bin)
    (bin_half organic_bin)
    
    
    (related organic_bin organic_1)
    (related paper_bin paper_1)
    (related plastic_bin plastic_1)
    
    (related organic_city_Bin organic_bin)
    (related paper_city_Bin paper_bin)
    (related plastic_city_Bin plastic_bin)
    
    (person_hands_empty personCapacity)
    
    (= (total-cost) 0)
    
    
     
  )

  ;; Goal State
  (:goal
    (and 
    	
    	 (garbage_in_bin organic_1 organic_bin)
    	 (old_bag_dumb organic_bin)
    	 
    	 (garbage_in_bin paper_1 paper_bin)
    	 (old_bag_dumb paper_bin)
    	 
    	 (garbage_in_bin plastic_1 plastic_bin)
    	 (old_bag_dumb plastic_bin)
    	 
    	 ;(garbage_in_bin organic_2 organic_bin)
    	 ;(garbage_in_bin organic_3 organic_bin)
    	
    	 ) ; Waste should be at location pos_4
  )
  
  
  (:metric minimize (total-cost))
)
