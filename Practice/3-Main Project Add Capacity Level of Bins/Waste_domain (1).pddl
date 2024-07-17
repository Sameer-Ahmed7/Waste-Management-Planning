(define(domain Waste_domain)
(:requirements:strips)
(:predicates

(paperBin ?paper_bin)
(plasticBin ?plastic_bin)
(organicBin ?organic_bin)
(have_substance ?substance)

(is_loc ?who ?pos)
(is_person ?person)
(substance_in_bin ?bin)

(bin_full ?bin)
(bin_half ?bin)
(bin_clear ?bin)

(new_bag ?bag)
(old_bag ?bag)




)
(:action Move
:parameters(?person ?bin ?from ?to)
:precondition (and(is_person ?person)(is_loc ?person ?from)(is_loc ?bin ?to))
:effect(and(not(is_loc ?person ?from))(is_loc ?person ?to)
))


;(:action Trashed
;:parameters(?person ?bin ?substance ?pos)
;:precondition (and(is_person ?person)(have_substance ?substance)(bin_clear ?bin)(is_loc ?person ?pos)(is_loc ?bin ?pos))
;:effect(and(not(have_substance ?substance))(not(bin_clear ?bin))(substance_in_bin ?bin)))



(:action Half_Trashed
:parameters(?person ?bin ?substance ?pos)
:precondition (and(is_person ?person)(have_substance ?substance)(bin_clear ?bin)(is_loc ?person ?pos)(is_loc ?bin ?pos))
:effect(and(not(have_substance ?substance))(not(bin_clear ?bin))(bin_half ?bin)(substance_in_bin ?bin)))

(:action Full_Trashed
:parameters(?person ?bin ?substance ?pos)
:precondition (and(is_person ?person)(have_substance ?substance)(bin_half ?bin)(is_loc ?person ?pos)(is_loc ?bin ?pos))
:effect(and(not(have_substance ?substance))(not(bin_half ?bin))(bin_full ?bin)(substance_in_bin ?bin)))


(:action Empty_Trashed
:parameters(?person ?bin ?bag ?pos)
:precondition (and(is_person ?person)(new_bag ?bag)(bin_full ?bin)(is_loc ?person ?pos)(is_loc ?bin ?pos))
:effect(and(not(new_bag ?bag))(not(bin_full ?bin))(bin_clear ?bin)(old_bag ?bag)))





)