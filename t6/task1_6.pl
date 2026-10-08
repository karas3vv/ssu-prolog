% ?- goal(R).

genl(N, N, []) :- !.
genl(N1, N2, [N1|L]) :-
    N1 < N2,
    N is N1 + 3,
    genl(N, N2, L).

insert(X, L, [X|L]).
insert(X, [H|T], [H|R]) :- insert(X, T, R).

goal(R) :-
    genl(3, 21, L),
    write('введите число: '),
    read(X),
    number(X),
    insert(X, L, R).
