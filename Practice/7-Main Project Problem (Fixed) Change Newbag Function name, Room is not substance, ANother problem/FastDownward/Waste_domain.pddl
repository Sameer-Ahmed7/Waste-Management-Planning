(define (domain Waste_domain)
  (:requirements :strips :typing :action-costs)

  ;; Types
  (:types
    DustBin location Bags Room Human garbageSubstance - object
    organicBin paperBin plasticBin - DustBin
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
    
    

  )
  
  
  ;; Functions
  (:functions
  	(total-cost)
  )

  ;; Actions
  (:action Move_To_Bin
    :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?from - location ?to - location)
    :precondition (and (have_garbage ?garbage)(is_loc ?who ?from)(is_loc ?bin ?to))
    :effect (and (not (is_loc ?who ?from))(is_loc ?who ?to) 
    		(increase (total-cost) 1)
    		)
   )
   
   
   (:action Move_From_Bin
    :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?to - location ?from - location)
    :precondition (and (garbage_in_bin ?garbage ?bin)(is_loc ?who ?to)(is_loc ?bin ?to))
    :effect (and (not (is_loc ?who ?to))(is_loc ?who ?from) 
		(increase (total-cost) 1)    	
    		)
   )
   
   
   (:action Move_To_Room
    :parameters (?who - Human ?room - Room ?garbage - garbageSubstance ?from - location ?to - location)
    :precondition (and (is_loc ?who ?from)(is_loc ?garbage ?to)(is_loc ?room ?to))
    :effect (and (not (is_loc ?who ?from))(is_loc ?who ?to)(have_garbage ?garbage)(not(is_loc ?garbage ?to))
    		(increase (total-cost) 1)
    		)
   )
  
  
  (:action Empty_Half_Trashed
     :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?pos - location)
     :precondition (and(have_garbage ?garbage)(bin_clear ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_garbage ?garbage))(not(bin_clear ?bin))(bin_half ?bin)(garbage_in_bin ?garbage ?bin)
     		(increase (total-cost) 1)
     		)
  )
  
  (:action Half_Full_Trashed
     :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?pos - location)
     :precondition (and(have_garbage ?garbage)(bin_half ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_garbage ?garbage))(not(bin_half ?bin))(bin_full ?bin)(garbage_in_bin ?garbage ?bin)
     		(increase (total-cost) 1)
     		)
  )
  
  (:action Full_Empty_Trashed
     :parameters (?who - Human ?bin - DustBin ?NewBag - newBag ?OldBag - oldBag ?pos - location)
     :precondition (and(have_newBag ?NewBag)(bin_full ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_newBag ?NewBag))(not(bin_full ?bin))(bin_clear ?bin)(have_oldBag ?OldBag)
     		(increase (total-cost) 1)
     		)
  )
  
  (:action Move_To_NewBag
     :parameters (?who - Human ?bin - DustBin ?NewBag - newBag ?from - location ?to - location)
     :precondition (and(bin_full ?bin)(is_loc ?who ?from)(is_loc ?NewBag ?to))
     :effect (and(not(is_loc ?who ?from))(have_newBag ?NewBag)(is_loc ?who ?to)
     		(increase (total-cost) 1)
     		)
  )
  
  
)
