% ?- product([2,3,4], P).

product([], 1).
product([H|T], P) :-
    product(T, P1),
    P is H * P1.
