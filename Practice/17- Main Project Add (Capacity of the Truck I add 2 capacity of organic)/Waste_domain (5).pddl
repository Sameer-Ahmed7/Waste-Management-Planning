(define (domain Waste_domain)
  (:requirements :strips :typing :action-costs :negative-preconditions)

  ;; Types
  (:types
    DustBin location Bags Room Human HumanCarry garbageSubstance CityBin Truck Time quantity Dumpyard - object
    organicBin paperBin plasticBin - DustBin
    organicCityBin paperCityBin plasticCityBin - CityBin
    newBag oldBag - Bags
    
    
  )

  ;; Predicates
  (:predicates
   
    (is_loc ?obj - object ?loc - location)  ; Object is at a location
    
    (have_garbage ?garbage - garbageSubstance)
   
    (garbage_in_bin ?garbage - garbageSubstance ?bin - DustBin)
    
    (bin_full ?bin - DustBin)
    (bin_half ?bin - DustBin)
    (bin_clear ?bin - DustBin)
    
    (have_newBag ?bag - newBag)
    (have_oldBag ?bag - oldBag)
    
    (related ?thing_1 ?thing_2 - object)
    (person_hands_full ?person_capacity - HumanCarry)
    (person_hands_empty ?person_capacity - HumanCarry)
    
    (old_bag_dumb ?bin)
    
    (is_morning ?time - Time)
    (is_evening ?time - Time)
    (is_night ?time - Time)
    
    (collected_cityBins_garbage ?truck - Truck)
    ;(disposed_cityBins_garbage ?truck - Truck)
    (disposed_cityBins_garbage ?truck - Truck)
    
    
    (plus1 ?q1 ?q2 - quantity)
    
    (Truck_capacity ?q - quantity)
    
    (between ?truck - Truck ?q_less_one ?q - quantity)
    

  )
  
  
  ;; Functions
  (:functions
  	(total-cost)
  )

  ;; Actions
  (:action Move_To_Bin
    :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?person_capacity - HumanCarry ?from - location ?to - location)
    :precondition (and (related ?who ?person_capacity)(related ?who ?bin)(person_hands_full ?person_capacity)(related ?bin ?garbage)(have_garbage ?garbage)(is_loc ?who ?from)(is_loc ?bin ?to))
    :effect (and (not (is_loc ?who ?from))(is_loc ?who ?to) 
    		(increase (total-cost) 1)
    		)
   )
   
   
   (:action Move_From_Bin
    :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?person_capacity - HumanCarry ?to - location ?from - location)
    :precondition (and (related ?who ?person_capacity)(related ?who ?bin)(person_hands_empty ?person_capacity)(related ?bin ?garbage)(garbage_in_bin ?garbage ?bin)(is_loc ?who ?to)(is_loc ?bin ?to))
    :effect (and (not (is_loc ?who ?to))(is_loc ?who ?from) 
		(increase (total-cost) 1)    	
    		)
   )
   
   
   (:action Move_To_Room
    :parameters (?who - Human ?bin - DustBin ?room - Room ?garbage - garbageSubstance ?person_capacity - HumanCarry ?from - location ?to - location)
    :precondition (and (related ?who ?person_capacity)(related ?who ?bin)(related ?who ?room)(person_hands_empty ?person_capacity)(related ?bin ?garbage)(is_loc ?who ?from)(is_loc ?garbage ?to)(is_loc ?room ?to))
    :effect (and (not (is_loc ?who ?from))(is_loc ?who ?to)(have_garbage ?garbage)(not(is_loc ?garbage ?to))(not(person_hands_empty ?person_capacity))(person_hands_full ?person_capacity)
    		(increase (total-cost) 1)
    		)
   )
  
  
  (:action Fill_Bin_Partially
     :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?person_capacity - HumanCarry ?pos - location)
     :precondition (and(related ?who ?person_capacity)(related ?who ?bin)(person_hands_full ?person_capacity)(related ?bin ?garbage)(have_garbage ?garbage)(bin_clear ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_garbage ?garbage))(not(bin_clear ?bin))(bin_half ?bin)(garbage_in_bin ?garbage ?bin)(not(person_hands_full ?person_capacity))(person_hands_empty ?person_capacity)
     		(increase (total-cost) 1)
     		)
  )
  
  (:action Fill_Bin_Completely
     :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?person_capacity - HumanCarry ?pos - location)
     :precondition (and(related ?who ?person_capacity)(related ?who ?bin)(person_hands_full ?person_capacity)(related ?bin ?garbage)(have_garbage ?garbage)(bin_half ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_garbage ?garbage))(not(bin_half ?bin))(bin_full ?bin)(garbage_in_bin ?garbage ?bin)(not(person_hands_full ?person_capacity))(person_hands_empty ?person_capacity)
     		(increase (total-cost) 1)
     		)
  )
  
  (:action Detach_Old_Bag
     :parameters (?who - Human ?bin - DustBin ?NewBag - newBag ?OldBag - oldBag ?person_capacity - HumanCarry ?pos - location)
     :precondition (and(related ?who ?person_capacity)(related ?who ?bin)(related ?who ?NewBag)(related ?who ?OldBag)(person_hands_full ?person_capacity)(have_newBag ?NewBag)(bin_full ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_newBag ?NewBag))(not(bin_full ?bin))(bin_clear ?bin)(have_oldBag ?OldBag)
     		(increase (total-cost) 1)
     		)
  )
  
  (:action Get_New_Bag
     :parameters (?who - Human ?bin - DustBin ?NewBag - newBag ?person_capacity - HumanCarry ?from - location ?to - location)
     :precondition (and(related ?who ?person_capacity)(related ?who ?bin)(related ?who ?NewBag)(person_hands_empty ?person_capacity)(bin_full ?bin)(is_loc ?who ?from)(is_loc ?NewBag ?to))
     :effect (and(not(is_loc ?who ?from))(have_newBag ?NewBag)(is_loc ?who ?to)(not(person_hands_empty ?person_capacity))(person_hands_full ?person_capacity)
     		(increase (total-cost) 1)
     		)
  )
  
  (:action Move_To_Bin_To_Change_Bag
     :parameters (?who - Human ?bin - DustBin ?NewBag - newBag ?person_capacity - HumanCarry ?from - location ?to - location)
     :precondition (and(related ?who ?person_capacity)(related ?who ?bin)(related ?who ?NewBag)(person_hands_full ?person_capacity)(have_newBag ?NewBag)(bin_full ?bin)(is_loc ?who ?from)(is_loc ?bin ?to))
     :effect (and(not(is_loc ?who ?from))(is_loc ?who ?to)
     		(increase (total-cost) 1)
     		)
  )
  
  
  (:action Move_Person_To_CityBin
      :parameters (?who - Human ?cityBin - CityBin ?bin - DustBin ?OldBag - oldBag ?person_capacity - HumanCarry ?from - location ?to - location )
      :precondition (and(related ?who ?person_capacity)(related ?who ?bin)(related ?who ?OldBag)(person_hands_full ?person_capacity)(related ?cityBin ?bin)(have_oldBag ?OldBag)(is_loc ?who ?from)(is_loc ?cityBin ?to))
      :effect (and(not(is_loc ?who ?from))(is_loc ?who ?to)(not(have_oldBag ?OldBag))(not(person_hands_full ?person_capacity))(person_hands_empty ?person_capacity)(old_bag_dumb ?bin)
      (increase (total-cost) 1)
      )
  )
  
  (:action Load_Organic_City_Garbage
    :parameters (?truck - Truck ?q_less_one ?q  - quantity ?bin - DustBin ?cityBin - CityBin ?from ?to - location)
    :precondition (and(plus1 ?q_less_one ?q)(Truck_capacity ?q_less_one)(old_bag_dumb ?bin)(related ?cityBin ?bin)(related ?truck ?cityBin)(is_loc ?truck ?from)(is_loc ?cityBin ?to))
    :effect (and(not(is_loc ?truck ?from))(is_loc ?truck ?to)(not(old_bag_dumb ?bin))
    	(not(Truck_capacity ?q_less_one))(Truck_capacity ?q)
    	(increase (total-cost) 1)
    )
  
  )
  
  
  (:action UnLoad_Organic_City_Garbage
    :parameters (?truck - Truck  ?q_less_one ?q  - quantity ?cityBin - CityBin ?dumpyard - Dumpyard ?from ?to - location)
    :precondition (and(Truck_capacity ?q_less_one)(between ?truck ?q_less_one ?q)(related ?truck ?cityBin)(related ?dumpyard ?truck)(is_loc ?truck ?from)(is_loc ?dumpyard ?to))
    :effect (and(not(is_loc ?truck ?from))(is_loc ?truck ?to)(disposed_cityBins_garbage ?truck)
    	(increase (total-cost) 1)
    	)
  
  )
  
  
)
