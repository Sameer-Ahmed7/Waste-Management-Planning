(define(domain Waste_domain)
(:requirements:strips)
(:predicates

(paperBin ?paper_bin)
(plasticBin ?plastic_bin)
(organicBin ?organic_bin)
(have ?bag)
(clear ?bin)
(is_loc ?who ?pos)
(is_person ?person)


)
(:action Move
:parameters(?person ?bin ?from ?to)
:precondition (and(is_person ?person)(is_loc ?person ?from)(is_loc ?bin ?to))
:effect(and(not(is_loc ?person ?from))(is_loc ?person ?to)
))



)