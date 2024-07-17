(define(domain Waste_domain)
(:requirements:strips)
(:predicates

(paperBin ?paper_bin)
(plasticBin ?plastic_bin)
(organicBin ?organic_bin)
(have_substance ?substance)
(clear ?bin)
(is_loc ?who ?pos)
(is_person ?person)
(substance_in_bin ?bin)


)
(:action Move
:parameters(?person ?bin ?from ?to)
:precondition (and(is_person ?person)(is_loc ?person ?from)(is_loc ?bin ?to))
:effect(and(not(is_loc ?person ?from))(is_loc ?person ?to)
))

(:action Trashed
:parameters(?person ?bin ?substance ?pos)
:precondition (and(is_person ?person)(have_substance ?substance)(clear ?bin)(is_loc ?person ?pos)(is_loc ?bin ?pos))
:effect(and(not(have_substance ?substance))(not(clear ?bin))(substance_in_bin ?bin)))






)