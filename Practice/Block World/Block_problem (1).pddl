(define(problem Block_problem)
(:domain Block_domain)
(:objects A,B,C)
(:init 
    (clear A)(on_table A)
    (clear B)(on_table B)
    (clear C)(on_table C)
       )
(:goal (and(on B A)(on C B)
)
)
)