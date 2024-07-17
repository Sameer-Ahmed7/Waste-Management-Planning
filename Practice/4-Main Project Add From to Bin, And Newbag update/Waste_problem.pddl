(define(problem Waste_problem)
(:domain Waste_domain)
(:objects paper_bin,plastic_bin,organic_bin,paper,plastic,organic,person,pos_1,pos_2,pos_3,pos_4,pos_5,new_bag,old_bag)
(:init 
    (Bin paper_bin)
    (Bin plastic_bin)
    (Bin organic_bin)
    (Bag new_bag)
    (Bag old_bag)
    
    (have_substance organic)
    (is_loc person pos_1)
    (is_loc paper_bin pos_2)
    (is_loc plastic_bin pos_3)
    (is_loc organic_bin pos_4)
    (is_loc new_bag pos_5)
    
    (is_person person)
    (bin_half paper_bin)
    (bin_half plastic_bin)
    (bin_half organic_bin)
    

    
       )
(:goal (and(is_loc person pos_1)(substance_in_bin organic_bin)(bin_clear organic_bin)))
)