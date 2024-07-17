(define (problem Waste_problem)
  (:domain Waste_domain)

  ;; Objects
  (:objects
    organic_bin - organicBin
    paper_bin - paperBin
    plastic_bin - plasticBin
    organic plastic paper - garbageSubstance
    bag - Bags
    
    pos_1 pos_2 pos_3 pos_4 - location  ; Existing locations from your code
    person - Human
  )

  ;; Initial State
  (:init
    
    (is_loc person pos_1) 
    (is_loc paper_bin pos_2)
    (is_loc plastic_bin pos_3)
    (is_loc organic_bin pos_4)
     
    
    
    (have_garbage organic)
    (bin_full paper_bin)
    (bin_full plastic_bin)
    (bin_full organic_bin)
    
    (have_newBag bag)
     
  )

  ;; Goal State
  (:goal
    (and (is_loc person pos_4)
    	 (garbage_in_bin organic_bin)
    	 
    	 ) ; Waste should be at location pos_4
  )
)
