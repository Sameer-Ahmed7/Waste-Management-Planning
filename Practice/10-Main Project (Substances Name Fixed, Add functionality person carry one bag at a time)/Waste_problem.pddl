(define(problem Waste_problem)
(:domain Waste_domain)
(:objects paper_bin,plastic_bin,organic_bin,
paper_1,plastic_1,organic_1,
paper_2,plastic_2,organic_2,
paper_3,plastic_3,organic_3,
person_capacity,
person,pos_1,pos_2,pos_3,pos_4,pos_5,pos_6,new_bag,old_bag,room)
(:init 
    (Bin paper_bin)
    (Bin plastic_bin)
    (Bin organic_bin)
    (Bag new_bag)
    (Bag old_bag)
    (Room room)
    (Location pos_1)
    (Location pos_2)
    (Location pos_3)
    (Location pos_4)
    (Location pos_5)
    (Location pos_6)
    
    ;(substance_bag paper_1)
    ;(substance_bag plastic_1)
    (substance_bag organic_1)
    
    ;(substance_bag paper_2)
    ;(substance_bag plastic_2)
    (substance_bag organic_2)
    
    ;(substance_bag paper_3)
    ;(substance_bag plastic_3)
    (substance_bag organic_3)
    
    
    (Related organic_bin organic_1)
    (Related organic_bin organic_2)
    (Related organic_bin organic_3)
    ;(have_substance organic)
    
    
    (person_hands_empty person_capacity)
    
    (is_loc person pos_1)
    (is_loc paper_bin pos_2)
    (is_loc plastic_bin pos_3)
    (is_loc organic_bin pos_4)
    (is_loc new_bag pos_5)
    (is_loc room pos_6)
    
    (is_loc organic_1 pos_6)
    (is_loc organic_2 pos_6)
    (is_loc organic_3 pos_6)
    
    (is_person person)
    (bin_half paper_bin)
    (bin_half plastic_bin)
    (bin_full organic_bin)
    

    
       )
(:goal (and(is_loc person pos_1)(substance_in_bin organic_1 organic_bin)
            (substance_in_bin organic_2 organic_bin)(substance_in_bin organic_3 organic_bin)))
)