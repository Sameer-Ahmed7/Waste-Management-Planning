(define(problem Wumpus_problem)
(:domain Wumpus_World)
(:objects 
    
   
    
    ;
    sq_1_1 
    sq_1_2 
    sq_1_3
    sq_1_4
    sq_2_1 
    sq_2_2 
    sq_2_3
    sq_2_4
    sq_3_1 
    sq_3_2 
    sq_3_3
    sq_3_4
    sq_4_1 
    sq_4_2 
    sq_4_3
    sq_4_4
    gold 
    wumpus 
    pit 
    agent 
    arrow)
(:init 

       (is_agent agent) 
       (at agent sq_1_1) 
       (at gold sq_4_4) 
       (at arrow sq_1_2)
       (pit sq_4_1)
       (pit sq_1_4)
       (wumpus sq_2_2)
       (wumpus sq_3_3)
       (is_arrow arrow)
       (adjacent sq_1_1 sq_1_2) 
       (adjacent sq_1_2 sq_1_1) 
       (adjacent sq_1_1 sq_2_1)
       (adjacent sq_2_1 sq_1_1)
       
       (adjacent sq_1_2 sq_2_2) 
       (adjacent sq_2_2 sq_1_2) 
       (adjacent sq_1_2 sq_1_3)
       (adjacent sq_1_3 sq_1_2)
       
       (adjacent sq_1_3 sq_1_4) 
       (adjacent sq_1_4 sq_1_3)
       (adjacent sq_1_3 sq_2_3) 
       (adjacent sq_2_3 sq_1_3) 
       
       
       ;=====
       
       (adjacent sq_2_1 sq_2_2) 
       (adjacent sq_2_2 sq_2_1) 
       (adjacent sq_2_1 sq_3_1)
       (adjacent sq_3_1 sq_2_1)
       
       (adjacent sq_2_2 sq_2_3) 
       (adjacent sq_2_3 sq_2_2) 
       (adjacent sq_2_2 sq_3_2)
       (adjacent sq_3_2 sq_2_2)
       
       (adjacent sq_2_3 sq_2_4) 
       (adjacent sq_2_4 sq_2_3)
       (adjacent sq_2_3 sq_3_3) 
       (adjacent sq_3_3 sq_2_3)
       
       ;=====
       
       (adjacent sq_3_1 sq_3_2) 
       (adjacent sq_3_2 sq_3_1) 
       (adjacent sq_3_1 sq_4_1)
       (adjacent sq_4_1 sq_3_1)
       
       (adjacent sq_3_2 sq_3_3) 
       (adjacent sq_3_3 sq_3_2) 
       (adjacent sq_3_2 sq_4_2)
       (adjacent sq_4_2 sq_3_2)
       
       (adjacent sq_3_3 sq_3_4) 
       (adjacent sq_3_4 sq_3_3)
       (adjacent sq_3_3 sq_4_3) 
       (adjacent sq_4_3 sq_3_3)
       
       ; ====
       (adjacent sq_4_1 sq_4_2)
       (adjacent sq_4_2 sq_4_1)
       (adjacent sq_4_2 sq_4_3) 
       (adjacent sq_4_3 sq_4_2)
       (adjacent sq_4_3 sq_4_4) 
       (adjacent sq_4_4 sq_4_3)
       
       
        ; kill_cost
    
    ;(= (kill_cost agent arrow sq_1_2 sq_2_2) 1)
    ;(= (kill_cost agent arrow sq_2_1 sq_2_2) 1)
    ;(= (kill_cost agent arrow sq_2_3 sq_2_2) 1)
    ;(= (kill_cost agent arrow sq_3_2 sq_2_2) 1)
    
    
    ;(= (kill_cost agent arrow sq_2_3 sq_3_3) 10)
    ;(= (kill_cost agent arrow sq_3_2 sq_3_3) 1)
    ;(= (kill_cost agent arrow sq_4_3 sq_3_3) 1)
    ;(= (kill_cost agent arrow sq_3_4 sq_3_3) 1)
    
    ;(= (per_kill_cost agent) 2)
    
    ; Move 
    (= (distance sq_1_1 sq_1_2) 1) ; Lower cost to move to adjacent square
    (= (distance sq_1_2 sq_1_1) 0)
    (= (distance sq_1_1 sq_2_1) 10) ; Higher cost to move to non-adjacent square
    (= (distance sq_2_1 sq_1_1) 10)
    
    (= (distance sq_1_2 sq_2_2) 1)
    (= (distance sq_2_2 sq_1_2) 1)
    (= (distance sq_1_2 sq_1_3) 1)
    (= (distance sq_1_3 sq_1_2) 1)
    
       
    (= (distance  sq_1_3 sq_1_4) 1)
    (= (distance sq_1_4 sq_1_3) 1)
    (= (distance sq_1_3 sq_2_3) 1)
    (= (distance sq_2_3 sq_1_3) 1)
    
    
    (= (distance sq_2_1 sq_2_2) 1)
    (= (distance sq_2_2 sq_2_1) 1)
    (= (distance sq_2_1 sq_3_1) 1)
    (= (distance sq_3_1 sq_2_1) 1)
    
       
       
    
    (= (distance sq_2_2 sq_2_3) 1)
    (= (distance sq_2_3 sq_2_2) 1)
    (= (distance sq_2_2 sq_3_2) 1)
    (= (distance sq_3_2 sq_2_2) 1)
    
    
    (= (distance sq_2_3 sq_2_4) 1)
    (= (distance sq_2_4 sq_2_3) 1)
    (= (distance sq_2_3 sq_3_3) 1)
    (= (distance sq_3_3 sq_2_3) 1)
    

    
    (= (distance sq_3_1 sq_3_2) 1)
    (= (distance sq_3_2 sq_3_1) 1)
    (= (distance sq_3_1 sq_4_1) 1)
    (= (distance sq_4_1 sq_3_1) 1)
    
    
    (= (distance sq_3_2 sq_3_3) 1)
    (= (distance sq_3_3 sq_3_2) 1)
    (= (distance sq_3_2 sq_4_2) 1)
    (= (distance sq_4_2 sq_3_2) 1)
    

    (= (distance sq_3_3 sq_3_4) 1)
    (= (distance sq_3_4 sq_3_3) 1)
    (= (distance sq_3_3 sq_4_3) 1)
    (= (distance sq_4_3 sq_3_3) 1)
    

    
    (= (distance sq_4_1 sq_4_2) 1)
    (= (distance sq_4_2 sq_4_1) 1)
    (= (distance sq_4_2 sq_4_3) 1)
    (= (distance sq_4_3 sq_4_2) 1)
    (= (distance sq_4_3 sq_4_4) 1)
    (= (distance sq_4_4 sq_4_3) 1)
    

    (= (per_km_cost agent) 200)
    
    (= (total-cost) 0)
       
       )
(:goal (and(at agent sq_1_1)(have agent gold))
)

(:metric minimize (total-cost))
)