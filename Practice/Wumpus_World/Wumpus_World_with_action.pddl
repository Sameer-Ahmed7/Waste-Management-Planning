(define(domain Wumpus_World)
(:requirements:strips :negative-preconditions :action-costs)
(:predicates

(at ?who ?pos)
(adjacent ?pos1 ?pos2)
(have ?who ?what)
(is_agent ?who)
(pit ?pos)
(wumpus ?pos)
(is_arrow ?what)



)

(:functions




;(kill_cost ?who ?what ?from ?to)
;(per_kill_cost ?who)

(distance ?from ?to)
; distance between locations
(per_km_cost ?who)


(total-cost)

)

(:action Move_agent
  :parameters (?who ?from ?to)
  :precondition (and (is_agent ?who) (adjacent ?from ?to) (at ?who ?from) (not (pit ?to)) (not (wumpus ?to)))
  :effect (and (not (at ?who ?from)) (at ?who ?to)
               (increase (total-cost) (* (distance ?from ?to) (per_km_cost ?who))))
)

(:action Pick
:parameters(?who ?what ?pos)
:precondition(and(is_agent ?who) (at ?who ?pos) (at ?what ?pos))
:effect(and(have ?who ?what) (not(at ?what ?pos))

)
)

(:action Kill
:parameters(?who ?what ?from ?to)
:precondition(and(is_agent ?who) (adjacent ?from ?to) (at ?who ?from) (wumpus ?to) (is_arrow ?what) (have ?who ?what))
:effect(and(not(wumpus ?to)) (not(have ?who ?what))
        
       ; (increase(total_cost)
        ;(* (kill_cost ?who ?what ?from ?to) (per_kill_cost ?who))
        )
        )

)