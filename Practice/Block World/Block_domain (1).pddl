(define(domain Block_domain)
(:requirements:strips)
(:predicates

(on ?from ?to)
(on_table ?who)
(clear ?who)

)
(:action Move
:parameters(?block ?from ?to)
:precondition (and(on ?from ?block)(clear ?block)(clear ?to))
:effect(and(not(on ?from ?block))(not(clear ?to))(on ?to ?block)(clear ?from))
)

(:action Move_To_Table
:parameters(?block ?from)
:precondition(and(on ?from ?block)(clear ?block))
:effect(and(not(on ?from ?block))(clear ?from)(on_table ?block))
)

(:action Move_From_Table
:parameters(?block ?to)
:precondition(and(on_table ?block)(clear ?block)(clear ?to))
:effect(and(not(clear ?to))(on ?to ?block) (not(on_table ?block))
)

))