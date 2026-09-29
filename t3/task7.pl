максимум(X, Y, Z, Max) :-
    X >= Y,
    X >= Z,
    Max is X,
    !.

максимум(X, Y, Z, Max) :-
    Y >= X,
    Y >= Z,
    Max is Y,
    !.

максимум(X, Y, Z, Max) :-
    Z >= X,
    Z >= Y,
    Max is Z,.