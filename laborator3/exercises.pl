/* Write a predicate subset(L, M) that is true if M is a subset of the elements in L, with elements in the same order as they appear in L. */
/* Suppose the we represent a time of day using a structure such as time(11, 26, 13), representing the time 11:26:13. We'd like to write a predicate add(T1, N, T2), which says that time T2 is N seconds after T1. */

/* ?- add(time(11, 30, 0), 75, T).
T = time(11, 31, 15).

?- add(time(11, 30, 0), N, time(11, 31, 15)).
N = 75.

?- add(T, 75, time(11, 31, 15)).
T = time(11, 30, 0).
*/

subset([],[]).
subset([H|L],[H|M]) :- subset(L,M).
subset([_|L],M) :- subset(L,M).

add(T1, N, T2) is true if time T2 is N seconds after T1.
add(time(H1, M1, S1), N, time(H2, M2, S2)) :-
    TotalSeconds1 is H1 * 3600 + M1 * 60 + S1,
    TotalSeconds2 is TotalSeconds1 + N,
    H2 is TotalSeconds2 // 3600,
    M2 is (TotalSeconds2 mod 3600) // 60,
    S2 is TotalSeconds2 mod 60.

temperature(C, F) :- F is 9 / 5 * C + 32.
temperature(C, F) :- C is (F - 32) * 5 / 9.

% select(X, L, M) is true if we can remove X anywhere in L to make M. Equivalently, it's true if we can insert X anywhere in M to make L.
select(X, [X|L], L).
select(X, [Y|L], [Y|M]) :- select(X, L, M).

