(define(domain Waste_domain)
(:requirements:strips :negative-preconditions)
(:predicates

(Bin ?bin) ; All bags Define
(Bag ?bag) ; All bags
(Room ?room)
(substance_bag ?substance)

(have_substance ?substance) ; Have Substance Means Person Carry The Substance 
(have_newBag ?new_bag) ; Have newbag
(have_OldBag ?old_bag) ; Have Oldbag

(is_loc ?who ?pos) ; Assign the location of different objects like bins, person etc
(is_person ?person) ; Check move and other thing only do by person
(substance_in_bin ?substance ?bin) ;Substance trashed by the person into the bin

; Check Capacity of the bins

(bin_full ?bin) ;Bin Full 
(bin_half ?bin) ; Bin Half
(bin_clear ?bin) ; Bin Empty

)

; Move Orignal Position to Bin



; Move to Bin

(:action Move_To_Bin
:parameters(?person ?bin ?substance ?from ?to)
:precondition (and(is_person ?person)(have_substance ?substance)(substance_bag ?substance)(Bin ?bin)(is_loc ?person ?from)(is_loc ?bin ?to))
:effect(and(not(is_loc ?person ?from))(is_loc ?person ?to)
))

; Move Bin to Orignal Position
(:action Move_From_Bin
:parameters(?person ?bin ?substance ?to ?from)
:precondition (and(is_person ?person)(Bin ?bin)(substance_bag ?substance)(substance_in_bin ?substance ?bin)(is_loc ?person ?to)(is_loc ?bin ?to))
:effect(and(not(is_loc ?person ?to))(is_loc ?person ?from)
))


; Move to Room

(:action Move_To_Room
:parameters(?person ?room ?bin ?substance ?from ?to)
:precondition (and(is_person ?person)(Room ?room)(Bin ?bin)(not(bin_full ?bin))(not(have_substance ?substance))(substance_bag ?substance)(not(is_loc ?person ?to))(is_loc ?person ?from)(is_loc ?substance ?to)(is_loc ?room ?to))
:effect(and(not(is_loc ?person ?from))(is_loc ?person ?to)(have_substance ?substance)(not(is_loc ?substance ?to))
))


; Capacity Check


; Half Trashed (Bin Filled Half)
(:action Empty_Half_Trashed
:parameters(?person ?bin ?substance ?pos)
:precondition (and(is_person ?person)(have_substance ?substance)(Bin ?bin)(substance_bag ?substance)(bin_clear ?bin)(is_loc ?person ?pos)(is_loc ?bin ?pos))
:effect(and(not(have_substance ?substance))(not(bin_clear ?bin))(bin_half ?bin)(substance_in_bin ?substance ?bin)))


; Full Trashed (Bin Filled Full)
;(:action Full_Trashed
;:parameters(?person ?bin ?substance ?pos)
;:precondition (and(is_person ?person)(have_substance ?substance)(substance ?substance)(bin_half ?bin)(is_loc ?person ?pos)(is_loc ?bin ?pos))
;:effect(and(not(have_substance ?substance))(not(bin_half ?bin))(bin_full ?bin)(substance_in_bin ?substance ?bin)))


; Full Trashed (Bin Filled Full)
(:action Half_Full_Trashed
:parameters(?person ?bin ?substance ?pos)
:precondition (and(is_person ?person)(have_substance ?substance)(Bin ?bin)(substance_bag ?substance)(bin_half ?bin)(is_loc ?person ?pos)(is_loc ?bin ?pos))
:effect(and(not(have_substance ?substance))(not(bin_half ?bin))(bin_full ?bin)(substance_in_bin ?substance ?bin)))


; Empty Trashed (Bin is Empty) Change Bag From Old to New
(:action Full_Empty_Trashed
:parameters(?person ?bin ?Newbag ?Oldbag ?from ?to)
:precondition (and(is_person ?person)(have_newBag ?Newbag)(Bin ?bin)(bin_full ?bin)(is_loc ?person ?to)(is_loc ?bin ?to))
:effect(and(not(have_newBag ?Newbag))(not(bin_full ?bin))(bin_clear ?bin)(have_OldBag ?Oldbag)(not(is_loc ?person ?from))(is_loc ?person ?to)))



; Move To The New Bag

(:action Change_NewBag
:parameters(?person ?bin ?new_bag ?from ?to)
:precondition (and(is_person ?person)(Bag ?new_bag)(Bin ?bin)(bin_full ?bin)(is_loc ?person ?from)(is_loc ?new_bag ?to))
:effect(and(not(is_loc ?person ?from))(have_newBag ?new_bag)(is_loc ?person ?to)
))






)