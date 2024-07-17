(define(domain Block_World)
(:requirements:strips)
(:predicates

(on ?x ?y) 
(on_table ?x)
(clear ?x)

)
(:action Move_Block
:parameters(?who ?from_x ?to_y)
:precondition (and(on ?who ?from_x)(clear ?who) (clear ?to_y))
:effect(and(not(on ?who ?from_x)) (on ?who ?to_y) (not(clear ?to_y)) (clear ?from_x))
)

(:action Move_to_table
:parameters(?who ?from_x)
:precondition(and(on ?who ?from_x) (clear ?who))
:effect(and(on_table ?who) (not(on ?who ?from_x)) (clear ?from_x))
)

(:action Move_from_table
:parameters(?who ?to_y)
:precondition(and(on_table ?who) (clear ?who) (clear ?to_y))
:effect(and(not(clear ?to_y)) (not(on_table ?who))  (on ?who ?to_y))
)

)