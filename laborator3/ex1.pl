% doua liste egale
egale([], []).
egale([H1|L1], [H2|L2]) :- H1=H2, egale(L1, L2).

%lungimi egale liste
lungimi_egale(L1, L2) :- length(L1, Length), length(L2, Length).

% lista_puncte/3 is used to filter out points where the Y-coordinate is
% not greater than Val a value from input
lista_puncte1([],_,[]). % daca lista de input e goala, lista rezultata Lfin va fi tot goala
lista_puncte1([punct(X,Y)|List1], Val, Lfin) :- lista_puncte1(List1, Val, Lrez), Y>Val, Lfin=[punct(X,Y) | Lrez].
lista_puncte1([punct(_,Y)|List1], Val, Lfin) :- lista_puncte1(List1, Val, Lrez), Y=<Val, Lfin=Lrez.
% var 2
lista_puncte2([],_,[]).
lista_puncte2([punct(X,Y)|List1], Val, [punct(X,Y)|Lrez]) :-  Y>Val, lista_puncte2(List1, Val, Lrez).
lista_puncte2([punct(_,Y)|List1], Val, Lrez) :-  Y=<Val, lista_puncte2(List1, Val, Lrez).

/* ?- lista_puncte([punct(1, 3), punct(2, 7), punct(3, 2), punct(4, 5)], 4, Result).
Result = [punct(2, 7), punct(4, 5)]. */

palindrome(L) :- reverse(L,L).

palindrome2([]).
palindrome2([_]).
palindrome2([H|List]) :- append(R,[H],List), palindrome2(R).

rev([],[]).
rev([X],[X]).
rev([H|T], L) :- rev(T,X), append(X,[H],L).
palindrome3(L) :- rev(L,L).

remove_duplicates([],[]).
remove_duplicates([H|L],M) :- remove_duplicates(L,M), member(H,M).
remove_duplicates([H|L],[H|M]) :- remove_duplicates(L,M), not(member(H,M)).

% atimes/3 returneaza true daca elementul din primul argument apare in
% in lista din al doilea argument de nr de ori precizat in al treilea
% argument
atimes(_,[],0).
atimes(N,[N|T],X) :- atimes(N,T,Y), X is Y + 1.
atimes(N,[H|T],X) :- atimes(N,T,X), H \= N.

% INSERT SORT
insertsort([],[]).
insertsort([H|T],L) :- insertsort(T,L1), insert(H,L1,L).

insert(X,[],[X]).
insert(X,[H|T],[X|[H|T]]) :- X<H.
insert(X,[H|T],[H|L]) :- X>=H, insert(X,T,L).

% QUICK SORT
quicksort([],[]).
quicksort([H|T],L) :- split1(H,T,A,B), quicksort(A,M), quicksort(B,N),
                        append(M,[H|N],L).
split1(_,[],[],[]).
split1(X,[H|T],[H|A],B) :- H<X, split1(X,T,A,B).
split1(X,[H|T],A,[H|B]) :- H>=X, split1(X,T,A,B).

% MERGE SORT
% merge(L, M, N): merge two sorted lists +L and +M into a sorted list ?N
merge([],L,L).
merge(L,[],L).
merge([X|L],[Y|M],[Z|N]) :-
    X=<Y, Z=X, merge(L,[Y|M],N);
    X>Y, Z=Y, merge([X|L],M,N).

% split(L, M, N): split L into two lists M and N of roughly equal length
split2([],[],[]).
split2([X],[X],[]).
split2([X,Y|L],[X|M],[Y|N]) :- split2(L,M,N).

% mergesort(L, M): sort L to M
mergesort([],[]).
mergesort([X],[X]).
mergesort(L,M) :- L=[_,_|_], split2(L,L1,L2),
    mergesort(L1,LS1), mergesort(L2,LS2),
    merge(LS1,LS2,M).

