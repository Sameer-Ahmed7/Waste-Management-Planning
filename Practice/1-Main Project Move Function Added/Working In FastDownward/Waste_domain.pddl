(define (domain Waste_domain)
  (:requirements :strips :typing)

  ;; Types
  (:types
    DustBin location Human - object
    organicBin paperBin plasticBin - DustBin
  )

  ;; Predicates
  (:predicates
   
    (is_loc ?obj - object ?loc - location)  ; Object is at a location

  )

  ;; Actions
  (:action Move
    :parameters (?who - Human ?bin - DustBin ?from - location ?to - location)
    :precondition (and (is_loc ?who ?from)(is_loc ?bin ?to))
    :effect (and (not (is_loc ?who ?from))(is_loc ?who ?to) )
  )
)
