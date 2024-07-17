(define (domain Waste_domain)
  (:requirements :strips :typing)

  ;; Types
  (:types
    DustBin location Human garbageSubstance - object
    organicBin paperBin plasticBin - DustBin
    
  )

  ;; Predicates
  (:predicates
   
    (is_loc ?obj - object ?loc - location)  ; Object is at a location
    (have_garbage ?garbage - garbageSubstance)
    (clear ?bin - DustBin)
    (garbage_in_bin ?bin - DustBin)
    

  )

  ;; Actions
  (:action Move
    :parameters (?who - Human ?bin - DustBin ?from - location ?to - location)
    :precondition (and (is_loc ?who ?from)(is_loc ?bin ?to))
    :effect (and (not (is_loc ?who ?from))(is_loc ?who ?to) )
  )
  
  (:action Trashed
    :parameters (?who - Human ?bin - DustBin ?garbage - garbageSubstance ?pos - location)
    :precondition (and(have_garbage ?garbage)(clear ?bin)(is_loc ?who ?pos)(is_loc ?bin ?pos))
    :effect (and(not(have_garbage ?garbage))(not(clear ?bin))(garbage_in_bin ?bin))
)
)
