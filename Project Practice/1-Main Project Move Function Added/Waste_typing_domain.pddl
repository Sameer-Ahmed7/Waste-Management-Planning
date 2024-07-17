(define(domain Waste_domain)
(:requirements :strips :typing)

(:types
   DustBin ShopperBag Human Location - object
   )

(:predicates

(paperBin ?paper_bin - DustBin)
(plasticBin ?plastic_bin - DustBin)
(organicBin ?organic_bin - DustBin)
(have ?bag - ShopperBag)
(clear ?bin - ShopperBag)
(is_loc ?who - object ?pos - Location)
(is_person ?person - Human)


)
(:action Move
:parameters(?person - Human ?bin - Dustbin ?from - Location ?to - Location)
:precondition (and(is_person ?person)(is_loc ?person ?from)(is_loc ?bin ?to))
:effect(and(not(is_loc ?person ?from))(is_loc ?person ?to)
))
)