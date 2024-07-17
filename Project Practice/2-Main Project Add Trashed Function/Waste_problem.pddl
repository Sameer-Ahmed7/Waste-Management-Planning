(define(problem Waste_problem)
(:domain Waste_domain)
(:objects paper_bin,plastic_bin,organic_bin,paper,plastic,organic,person,pos_1,pos_2,pos_3,pos_4)
(:init 
    (paperBin paper_bin)
    (plasticBin plastic_bin)
    (organicBin organic_bin)
    (have_substance organic)
    (is_loc person pos_1)
    (is_loc paper_bin pos_2)
    (is_loc plastic_bin pos_3)
    (is_loc organic_bin pos_4)
    (is_person person)
    (clear paper_bin)
    (clear plastic_bin)
    (clear organic_bin)
    
    
    
       )
(:goal (and(is_loc person pos_4)(substance_in_bin organic_bin)))
)