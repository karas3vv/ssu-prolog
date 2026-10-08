% ?- goal(5, L, S).

genl(0, _, []) :- !.
genl(N, X, [X|L]) :-
    N > 0,
    N1 is N - 1,
    X1 is X + 1,
    genl(N1, X1, L).

sum_list1([], 0).
sum_list1([H|T], S) :-
    sum_list1(T, S1),
    S is H + S1.

goal(N, L, S) :-
    integer(N), N >= 0,
    genl(N, 10, L),
    sum_list1(L, S).
