(define(domain Waste_domain)
(:requirements:strips :negative-preconditions)
(:predicates

(Bin ?bin) ; All Bins Define
;(Bag ?bag) ; All bags
(CityBin ?CityBin) ; All cityBin define

(OldBag ?OldBag) ; All Old Bags
(NewBag ?NewBag) ; All New Bags
(Room ?room) ; Room (Where Garbage collect)
(Location ?loc) ;Location of the Bins, Persons etc
(old_bag_dumb ?bin) ; Old Bags Dumb (True/False)
(Time ?time)


(garbage_bag ?garbage) ;Is this thing garbage or not?

(have_garbage ?garbage) ; Have garbage Means Person Carry The garbage 
(have_newBag ?new_bag) ; Have NewBag Means Person Carry The NewBag 
(have_OldBag ?bin ?old_bag) ; Have OldBag Means Person Carry The OldBag (Of Perticular Substance)

(is_loc ?who ?pos) ; Assign the location of different objects like bins, person etc
(is_person ?person) ; Check move and other thing only do by person
(is_truck ?truck)

(garbage_in_bin ?garbage ?bin) ;garbage trashed by the person into the bin


; Check Capacity of the bins
(bin_full ?bin) ;Bin Full 
(bin_half ?bin) ; Bin Half
(bin_clear ?bin) ; Bin Empty


(Related ?bin ?garbage) ; Bin is only related to the garbage like organic bin only related to organic
(person_hands_full ?person_capacity); Person Have something
(person_hands_empty ?person_capacity) ; Person Have nothing

(is_morning ?time) ; For Organic 
(is_evening ?time) ; For Paper
(is_night ?time) ; For Plastic
(collected_cityBins_garbage ?truck) ; Collected CITYBINS Garbage BY Perticular Truck
(disposed_cityBins_garbage ?truck) ; Deposite CITYBINS Garbage BY Perticular Truck to Dumpyard

(is_dumpyard ?dumpyard) ; Check Dumpyard



)

; =============== Move Different Position to Bin =======================

(:action Move_To_Bin
:parameters(?person ?bin ?garbage ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                (Related ?bin ?garbage)
                (have_garbage ?garbage)
                (garbage_bag ?garbage)
                (Bin ?bin)(is_loc ?person ?from)
                (is_loc ?bin ?to)
                (Location ?to)
                (Location ?from)
                )
:effect(and
        (not(is_loc ?person ?from))
        (is_loc ?person ?to)
))


; =============== Move Bin to Different Position =======================

(:action Move_From_Bin
:parameters(?person ?bin ?garbage ?person_capacity ?to ?from)
:precondition (and
                (is_person ?person)
                (person_hands_empty ?person_capacity)
                (Related ?bin ?garbage)
                (Bin ?bin)
                (garbage_bag ?garbage)
                (garbage_in_bin ?garbage ?bin)
                (is_loc ?person ?to)
                (is_loc ?bin ?to)
                (Location ?to)
                (Location ?from)
            )
:effect(and
            (not(is_loc ?person ?to))
            (is_loc ?person ?from)
))


; =============== Move To Room =======================

(:action Move_To_Room
:parameters(?person ?room ?bin ?garbage ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (person_hands_empty ?person_capacity)
                (Related ?bin ?garbage)
                (Room ?room)(Bin ?bin)
                (not(bin_full ?bin))
                (not(have_garbage ?garbage))
                (garbage_bag ?garbage)
                (not(is_loc ?person ?to))
                (is_loc ?person ?from)
                (is_loc ?garbage ?to)
                (is_loc ?room ?to)
                (Location ?to)
                (Location ?from)
            )
:effect(and
            (not(is_loc ?person ?from))
            (is_loc ?person ?to)
            (have_garbage ?garbage)
            (not(is_loc ?garbage ?to))
            (not(person_hands_empty ?person_capacity))
            (person_hands_full ?person_capacity)
))


; =============== Half Trashed (Bin Filled Half) =======================

(:action Fill_Bin_Partially
:parameters(?person ?bin ?garbage ?person_capacity ?pos)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                (Related ?bin ?garbage)
                (have_garbage ?garbage)
                (Bin ?bin)
                (garbage_bag ?garbage)
                (bin_clear ?bin)
                (is_loc ?person ?pos)
                (is_loc ?bin ?pos)
                (Location ?pos)
                )
:effect(and
            (not(have_garbage ?garbage))
            (not(bin_clear ?bin))
            (bin_half ?bin)
            (garbage_in_bin ?garbage ?bin)
            (not(person_hands_full ?person_capacity))
            (person_hands_empty ?person_capacity)
))

; =============== Full Trashed (Bin Filled Full) =======================


(:action Fill_Bin_Completely
:parameters(?person ?bin ?garbage ?person_capacity ?pos)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                (Related ?bin ?garbage)
                (have_garbage ?garbage)
                (Bin ?bin)
                (garbage_bag ?garbage)
                (bin_half ?bin)
                (is_loc ?person ?pos)
                (is_loc ?bin ?pos)
                (Location ?pos)
                
                )
:effect(and
            (not(have_garbage ?garbage))
            (not(bin_half ?bin))
            (bin_full ?bin)
            (garbage_in_bin ?garbage ?bin)
            (not(person_hands_full ?person_capacity))
            (person_hands_empty ?person_capacity)

))


; =============== Take Old Bag And Empty The Bin =======================

(:action Detach_Old_Bag
:parameters(?person ?bin ?new_bag ?Oldbag ?person_capacity ?to)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                ;(Bag ?new_bag)
                ;(Bag ?Oldbag)
                (NewBag ?new_bag)
                (OldBag ?Oldbag)
                (have_newBag ?new_bag)
                (Bin ?bin)
                (bin_full ?bin)
                (is_loc ?person ?to)
                (is_loc ?bin ?to)
                (Location ?to)
                
                )
:effect(and
        (not(have_newBag ?new_bag))
        (not(bin_full ?bin))
        (bin_clear ?bin)
        (have_OldBag ?bin ?Oldbag)
        ;(not(person_hands_full ?person_capacity))
        ;(person_hands_empty ?person_capacity)

))

; =============== Move to Bin to Change Bag (Assign New Bag) =======================

(:action Move_To_Bin_To_Change_Bag
:parameters(?person ?bin ?new_bag ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (person_hands_full ?person_capacity)
                (NewBag ?new_bag)
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


; =============== Get New Bag =======================

(:action Get_New_Bag
:parameters(?person ?bin ?new_bag ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (person_hands_empty ?person_capacity)
                (NewBag ?new_bag)
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


; ===============Move To City Bins =======================

(:action Move_Person_To_CityBin
:parameters(?person ?CityBin ?bin ?Oldbag ?person_capacity ?from ?to)
:precondition (and
                (is_person ?person)
                (CityBin ?CityBin)
                (Bin ?bin)
                (person_hands_full ?person_capacity)
                (OldBag ?Oldbag)
                (have_OldBag ?bin ?Oldbag)
                (Related ?CityBin ?bin)
                (is_loc ?person ?from)
                (is_loc ?CityBin ?to)
                (Location ?to)
                (Location ?from)
            )
:effect(and
            (not(is_loc ?person ?from))
            (is_loc ?person ?to)
            (not(have_OldBag ?bin ?Oldbag))
            (not(person_hands_full ?person_capacity))
            (person_hands_empty ?person_capacity)
            (old_bag_dumb ?CityBin)
))


; =============== Organic Truck Move to CityBins =======================

(:action Load_Organic_City_Garbage 
:parameters(?truck ?CityBin ?time ?from ?to)
:precondition (and
                (is_truck ?truck)
                (Time ?time)
                (CityBin ?CityBin)
                ;(OldBag ?Oldbag)
                ;(old_bag_dumb ?CityBin)
                (is_morning ?time)
                (Related ?truck ?CityBin)
                (is_loc ?truck ?from)
                (is_loc ?CityBin ?to)
                (Location ?to)
                (Location ?from)
            )
:effect(and
            (not(is_loc ?truck ?from))
            (is_loc ?truck ?to)
            ;(not(have_OldBag ?bin ?Oldbag))
            ;(not(person_hands_full ?person_capacity))
            ;(person_hands_empty ?person_capacity)
            ;(old_bag_dumb ?CityBin)
            (collected_cityBins_garbage ?truck)
))


; =============== Organic Truck Move From CityBins To Dumpyard =======================

(:action Unload_Organic_City_Garbage 
:parameters(?truck ?dumpyard ?time ?from ?to)
:precondition (and
                (is_truck ?truck)
                (Time ?time)
                (is_dumpyard ?dumpyard)
                ;(OldBag ?Oldbag)
                ;(old_bag_dumb ?CityBin)
                (is_morning ?time)
                (Related ?dumpyard ?truck)
                (is_loc ?truck ?from)
                (is_loc ?dumpyard ?to)
                (Location ?to)
                (Location ?from)
                (collected_cityBins_garbage ?truck)
            )
:effect(and
            (not(is_loc ?truck ?from))
            (is_loc ?truck ?to)
            ;(not(have_OldBag ?bin ?Oldbag))
            ;(not(person_hands_full ?person_capacity))
            ;(person_hands_empty ?person_capacity)
            ;(old_bag_dumb ?CityBin)
            (not(is_morning ?time))
            (is_evening ?time)
            (not(collected_cityBins_garbage ?truck))
            (disposed_cityBins_garbage ?truck)
))


)