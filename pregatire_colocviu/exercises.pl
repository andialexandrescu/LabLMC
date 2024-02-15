% BUBBLE SORT
bubblesort(SortedList, SortedList).
bubblesort(InputList, SortedList) :- swap(InputList, TempList), !, printlist(TempList), bubblesort(TempList, SortedList).

swap([X,Y|T], [Y,X|T]) :- X>Y.
swap([H|Tail], [H|Lrez]) :- swap(Tail, Lrez).

%INSERTION SORT
insertionsort([],[]).
insertionsort([H|TInputList], SortedList) :- insertionsort(TInputList, TempList), printlist(TempList), insertItem(H, TempList, SortedList).

% insereaza la stanga
insertItem(X, List, [X|List]).
insertItem(X, [H|Tail], [H|Lrez]) :- H<X, !, insertItem(X, Tail, Lrez).

printlist([]) :- nl.
printlist([H|T]) :- write(H), write(' '), printlist(T).

%QUICK SORT (implementat: ultimul element va fi pivotul)
quicksort([], []).
quicksort([H|TInputList], SortedList) :- partition_quicksort(TInputList, H, Left, Right), quicksort(Left, Ls), quicksort(Right, Rs), append(Ls, [H|Rs], SortedList).

% Y e pivot, al doilea argument e lista de sortat, ultimele doua sunt
% partitiile din stanga si dreapta
partition_quicksort(_, [], [], []).
partition_quicksort(Y, [X|Xs], [X|Ls], Rs) :- X=<Y, partition_quicksort(Y, Xs, Ls, Rs).
partition_quicksort(Y, [X|Xs], Ls, [X|Rs]) :- X>Y, partition_quicksort(Y, Xs, Ls, Rs).

% MERGE SORT
mergesort([],[]).
mergesort([A],[A]).
mergesort([A,B|TInputList], SortedList) :- split_mergesort([A,B|TInputList], L1, L2), mergesort(L1, S1), mergesort(L2, S2), merge(S1, S2, SortedList).

split_mergesort([],[],[]).
split_mergesort([A],[A],[]).
split_mergesort([A,B|R], [A|Ra], [B|Rb]) :- split_mergesort(R, Ra, Rb).

merge(A,[],A).
merge([],B,B).
merge([A|Ra], [B|Rb], [A|M]) :- A=<B, merge(Ra, [B|Rb], M).
merge([A|Ra], [B|Rb], [B|M]) :- A>B, merge([A|Ra], Rb, M).

% permutari
del(X, [X|List1], List1).
del(X, [Y|List], [Y|List1]) :- del(X, List, List1).

single_permutation([],[]).
single_permutation(L, [X|P]) :- del(X, L, TempList), single_permutation(TempList, P).

list_permutation(L, Result) :- findall(Permutare, single_permutation(L, Permutare), Result).

% Given a range of integers by its lower and upper limit, construct a
% list of all prime numbers in that range.
% is_prime/1 checks if a number is prime
is_prime(2).
is_prime(3).
is_prime(N) :- N>3, \+ has_factor(N, 2).

% has_factor/2 checks if a number has a factor
has_factor(N, Factor) :- N mod Factor =:= 0.
has_factor(N, Factor) :- Factor * Factor =< N, NextFactor is Factor + 1, has_factor(N, NextFactor).

% prime_list/2 finds all prime numbers in a list
prime_list(InputList, PrimeNumbers) :- findall(X, (member(X, InputList), is_prime(X)), PrimeNumbers).

% gcd/3 calculates the Greatest Common Divisor (GCD) of two numbers
gcd(X,0,X) :- X > 0.
gcd(X,Y,G) :- Y > 0, Z is X mod Y, gcd(Y,Z,G).



