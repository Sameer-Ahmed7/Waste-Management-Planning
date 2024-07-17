(define(domain Waste_domain)
(:requirements:strips :negative-preconditions)
(:predicates

(Bin ?bin) ; All bags Define
(Bag ?bag) ; All bags
(Room ?room) ; Room (Where Garbage collect)
(Location ?loc) ;Location of the Bins, Persons etc


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

(Related ?bin ?substance) ; Bin is only related to the substance like organic bin only related to organic
(person_hands_full ?person_capacity); Person Have something
(person_hands_empty ?person_capacity) ; Person Have nothing

)

; Move Orignal Position to Bin



; Move to Bin

(:action Move_To_Bin
:parameters(?person ?bin ?substance ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person) No
                (person_hands_full ?person_capacity)
                (Related ?bin ?substance)
                (have_substance ?substance)
                (substance_bag ?substance) No
                (Bin ?bin) No
		(is_loc ?person ?from)
                (is_loc ?bin ?to)
                (Location ?to) NO
                (Location ?from) No
                )
:effect(and
        (not(is_loc ?person ?from))
        (is_loc ?person ?to)
))




;;; =============================This code change(20-4-2024 6:30 Am)  =========================

;(:action Move_ForChange_Bag
;:parameters(?person ?bin ?new_bag ?person_capacity ?from ?to)
;:precondition (and
;                (is_person ?person) No
;                (person_hands_full ?person_capacity)
;                (Bag ?new_bag) No
;                (have_newBag ?new_bag) 
;                (Bin ?bin) No
;                (is_loc ?person ?from)
;                (is_loc ?bin ?to)
;                (Location ?to) No
;                (Location ?from) No
;                )
;:effect(and
;        (not(is_loc ?person ?from))
;        (is_loc ?person ?to)
;))

; Move Bin to Orignal Position
(:action Move_From_Bin
:parameters(?person ?bin ?substance ?person_capacity ?to ?from)
:precondition (and
                (is_person ?person) No
                (person_hands_empty ?person_capacity)
                (Related ?bin ?substance)
                (Bin ?bin) No
                (substance_bag ?substance) No
                (substance_in_bin ?substance ?bin)
                (is_loc ?person ?to) 
                (is_loc ?bin ?to)
                (Location ?to) NO
                (Location ?from) No
            )
:effect(and
            (not(is_loc ?person ?to))
            (is_loc ?person ?from)
))


; Move to Room

(:action Move_To_Room
:parameters(?person ?room ?bin ?substance ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (person_hands_empty ?person_capacity)
                (Related ?bin ?substance)
                (Room ?room)(Bin ?bin)
                (not(bin_full ?bin))
                (not(have_substance ?substance))
                (substance_bag ?substance)
                (not(is_loc ?person ?to))
                (is_loc ?person ?from)
                (is_loc ?substance ?to)
                (is_loc ?room ?to)
                (Location ?to)
                (Location ?from)
            )
:effect(and
            (not(is_loc ?person ?from))
            (is_loc ?person ?to)
            (have_substance ?substance)
            (not(is_loc ?substance ?to))
            (not(person_hands_empty ?person_capacity))
            (person_hands_full ?person_capacity)
))


; Capacity Check


; Half Trashed (Bin Filled Half)
(:action Empty_Half_Trashed
:parameters(?person ?bin ?substance ?person_capacity ?pos)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                (Related ?bin ?substance)
                (have_substance ?substance)
                (Bin ?bin)
                (substance_bag ?substance)
                (bin_clear ?bin)
                (is_loc ?person ?pos)
                (is_loc ?bin ?pos)
                (Location ?pos)
                )
:effect(and
            (not(have_substance ?substance))
            (not(bin_clear ?bin))
            (bin_half ?bin)
            (substance_in_bin ?substance ?bin)
            (not(person_hands_full ?person_capacity))
            (person_hands_empty ?person_capacity)
))


; Full Trashed (Bin Filled Full)
(:action Half_Full_Trashed
:parameters(?person ?bin ?substance ?person_capacity ?pos)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                (Related ?bin ?substance)
                (have_substance ?substance)
                (Bin ?bin)
                (substance_bag ?substance)
                (bin_half ?bin)
                (is_loc ?person ?pos)
                (is_loc ?bin ?pos)
                (Location ?pos)
                
                )
:effect(and
            (not(have_substance ?substance))
            (not(bin_half ?bin))
            (bin_full ?bin)
            (substance_in_bin ?substance ?bin)
            (not(person_hands_full ?person_capacity))
            (person_hands_empty ?person_capacity)

))


; Empty Trashed (Bin is Empty) Change Bag From Old to New
; I will update this (Actually the problem is here I am assigning that this effect will erase person_capacity=empty)
;(:action Full_Empty_Trashed
;:parameters(?person ?bin ?new_bag ?person_capacity ?Oldbag ?from ?to)
;:precondition (and(is_person ?person)(person_hands_full ?person_capacity)(Bag ?new_bag)(have_newBag ?new_bag)(Bin ?bin)(bin_full ?bin)(is_loc ?person ?to)(is_loc ?bin ?to))
;:effect(and(not(have_newBag ?new_bag))(not(bin_full ?bin))(bin_clear ?bin)(have_OldBag ?Oldbag)(not(is_loc ?person ?from))(is_loc ?person ?to)(is_loc ?person ?to)(not(person_hands_full ?person_capacity))(person_hands_empty ?person_capacity)

;))

; Empty Trashed (Bin is Empty) Change Bag From Old to New
; I will update this (Actually the problem is here I am assigning that this effect will erase person_capacity=empty)



;;; =============================This code change(20-4-2024 6:30 Am)  =========================

(:action Get_OldBag_Empty_Trashed
:parameters(?person ?bin ?new_bag ?Oldbag ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                (Bag ?new_bag)
                (Bag ?Oldbag)
                (have_newBag ?new_bag)
                (Bin ?bin)
                (bin_full ?bin)
                (is_loc ?person ?to)
                (is_loc ?bin ?to)
                (Location ?to)
                (Location ?from)
                )
:effect(and
        (not(have_newBag ?new_bag))
        (not(bin_full ?bin))
        (bin_clear ?bin)
        (have_OldBag ?Oldbag)
        (not(person_hands_full ?person_capacity))
        (person_hands_empty ?person_capacity)

))

(:action Move_And_Change_Bag
:parameters(?person ?bin ?new_bag ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                (Bag ?new_bag)
                (have_newBag ?new_bag)
                (Bin ?bin)
                (bin_full ?bin)
                (is_loc ?person ?from)
                (is_loc ?bin ?to)
                (Location ?to)
                (Location ?from)
                )
:effect(and
        (not(is_loc ?person ?from))
        (is_loc ?person ?to)
))

;(:action Move_ForChange_Bag
;:parameters(?person ?bin ?new_bag ?Oldbag ?person_capacity ?from ?to)
;:precondition (and
;                (is_person ?person)
;                (person_hands_full ?person_capacity)
;                (Bag ?new_bag)
;                (Bag ?Oldbag)
;                (have_newBag ?new_bag)
;                (Bin ?bin)
;                (bin_full ?bin)
;                (is_loc ?person ?from)
;                (is_loc ?bin ?to)
;                (Location ?to)
;                (Location ?from)
;                )
;:effect(and
;        (not(have_newBag ?new_bag))
;        (not(bin_full ?bin))
;        (bin_clear ?bin)
;        (not(is_loc ?person ?from))
;        (is_loc ?person ?to)
;        (have_OldBag ?Oldbag)
;        (not(person_hands_full ?person_capacity))
;        (person_hands_empty ?person_capacity)

;))
;:effect(and(not(have_newBag ?new_bag))(not(bin_full ?bin))(bin_clear ?bin)(have_OldBag ?Oldbag)(not(is_loc ?person ?from))(is_loc ?person ?to)(is_loc ?person ?to)(not(person_hands_full ?person_capacity))(person_hands_empty ?person_capacity)





; Move To The New Bag

(:action Get_NewBag
:parameters(?person ?bin ?new_bag ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (person_hands_empty ?person_capacity)
                (Bag ?new_bag)
                (Bin ?bin)
                (bin_full ?bin)
                (is_loc ?person ?from)
                (is_loc ?new_bag ?to)
                (Location ?to)
                (Location ?from)
                )
:effect(and
            (not(is_loc ?person ?from))
            (have_newBag ?new_bag)
            (is_loc ?person ?to)
            (not(person_hands_empty ?person_capacity))
            (person_hands_full ?person_capacity)
))






)