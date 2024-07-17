(define (domain Waste_domain)
  (:requirements :strips :typing)

  ;; Types
  (:types
    DustBin location Bags Human garbageSubstance - object
    organicBin paperBin plasticBin - DustBin
    ;newBag oldBag - Bags
    
  )

  ;; Predicates
  (:predicates
   
    (is_loc ?obj - object ?loc - location)  ; Object is at a location
    (have_garbage ?garbage - garbageSubstance)
   
    (garbage_in_bin ?bin - DustBin)
    
    (bin_full ?bin - DustBin)
    (bin_half ?bin - DustBin)
    (bin_clear ?bin - DustBin)
    
    (have_newBag ?bag - Bags)
    (have_oldBag ?bag - Bags)
    
    

  )

  ;; Actions
  (:action Move
    :parameters (?who - Human ?bin - DustBin ?from - location ?to - location)
    :precondition (and (is_loc ?who ?from)(is_loc ?bin ?to))
    :effect (and (not (is_loc ?who ?from))(is_loc ?who ?to) )
   )
  
  
  (:action Half_Trashed
     :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?pos - location)
     :precondition (and(have_garbage ?garbage)(bin_clear ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_garbage ?garbage))(not(bin_clear ?bin))(bin_half ?bin)(garbage_in_bin ?bin))
  )
  
  (:action Full_Trashed
     :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?pos - location)
     :precondition (and(have_garbage ?garbage)(bin_half ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_garbage ?garbage))(not(bin_half ?bin))(bin_full ?bin)(garbage_in_bin ?bin))
  )
  
  (:action Empty_Trashed
     :parameters (?who - Human ?bin - DustBin ?bag - Bags ?pos - location)
     :precondition (and(have_newBag ?bag)(bin_full ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
     :effect (and(not(have_newBag ?bag))(not(bin_full ?bin))(bin_clear ?bin)(have_oldBag ?bag))
  )
  
)
