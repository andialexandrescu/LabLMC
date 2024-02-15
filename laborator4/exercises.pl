in_interval(A, B, X) :- A=<X, X=<B.
not_interval(A, B, X) :- X<A ; X>B.
not_interval_2(A, B, X) :- \+ in_interval(A, B, X).

afis_paritate(X):- integer(X), (X mod 2 =:= 0, Parit=par; X mod 2 =\= 0, Parit=impar), write(X), write(' este '), write(Parit).

% suma 1+1/2+1/3+....+1/N unde N e un numar natural mai mare strict decat 0, transmis ca argument
sum_aux(K, N, S_partial, S_final):-
    K =< N,
    S_partial_nou is S_partial + 1/K,
    K1 is K+1, sum_aux_a1(K1, N, S_partial_nou, S_final).
sum_aux(K, N, S_partial, S_final):- K=:=N+1, S_final = S_partial.
% randul de mai sus se putea scrie mai scurt:
% sum_f1_aux(K, N, S_partial, S_partial):- K=:=N+1.
suma_fractii(N,S) :- sum_aux(1,N,0,S).

prefix(L,N,Prefix):- length(Prefix,N), append(Prefix,_,L).

% base case: empty prefix
prefix2(_,0,[]).
% recursive case: construct prefix
prefix2([X|Rest],N,[X|Prefix]) :- N>0, M is N - 1, prefix(Rest,M,Prefix).

% intersectia pentru doua multimi
intersectie_multimi([],_,[]).
intersectie_multimi([H|M1],M2,[H|Intersectie]) :- member(H,M2), intersectie_multimi(M1,M2,Intersectie).
intersectie_multimi([H|M1],M2,Intersectie) :- \+ member(H,M2), intersectie_multimi(M1,M2,Intersectie).

reuniune_multimi([],M2,Reuniune) :- Reuniune = M2.
reuniune_multimi([H|M1],M2,[H|Reuniune]) :- \+ member(H,M2), reuniune_multimi(M1,M2,Reuniune).
reuniune_multimi([H|M1],M2,Reuniune) :- member(H,M2), reuniune_multimi(M1,M2,Reuniune).

diferenta_multimi([],_,[]).
diferenta_multimi([H|M1],M2,[H|Rez]) :- \+ member(H,M2), diferenta_multimi(M1,M2,Rez).
diferenta_multimi([H|M1],M2,Rez) :- member(H,M2), diferenta_multimi(M1,M2,Rez).

aduna_elemente([],[],[]).
aduna_elemente([H1|T1],[H2|T2],[Hsum|Tsum]):- Hsum is H1 + H2, aduna_elemente(T1,T2,Tsum).

matrice(m1, [[22,17,11],[21,31,88],[90,15,43]]).
afis_mat([]).
afis_mat([Linie|RestMatrice]) :- afis_lin(Linie), afis_mat(RestMatrice).
afis_lin([H] ):- write(H) ,nl, !.
afis_lin([H|T]) :- write(H), write(' '), afis_lin(T).
afis_mat_nume(Nume) :- matrice(Nume,Mat), afis_mat(Mat).

% verifica daca toate elem dintr-o matrice sunt impare
matrice_impar(Nume) :- matrice(Nume,M), mat_impar(M).
mat_impar([Linie|M]) :- lin_impar(Linie), mat_impar(M).
mat_impar([]).
lin_impar([H|T]) :- H mod 2 =:= 1, lin_impar(T).
lin_impar([]).

% minimul dintr-o matrice
min_mat_nume(Nume,Min) :- matrice(Nume,Mat), min_mat(Mat,Min).
min_mat([Linie|T],Min) :- min_linie(Linie,MinLin), min_mat(T,MinT), Min is min(MinLin,MinT).
min_mat([Linie],Min):- min_linie(Linie,Min).
min_linie([H|T],Min):- min_linie(T,MinT), Min is min(H,MinT).
min_linie([H],H).

/* Sa se scrie un predicat care parcurge doua matrici (cu acelasi numar de linii si coloane) continand numere naturale nenule. Predicatul va calcula o a treia matrice in care fiecare element de pe pozitia i,j e obtinut concatenand elementul de pe pozitia i,j din prima matrice, cu elementul de pe aceeasi pozitie din a doua matrice. */
matrice(m2,
[[5,2,5],
[47,15,6],
[27,3,1]]
).
combina_elemente([H1|T1],[H2|T2],[Hsum|Tsum]):- number_chars(H1,Lcif1), number_chars(H2,Lcif2), append(Lcif1,Lcif2,Lcif), number_chars(Hsum, Lcif),combina_elemente(T1,T2,Tsum).
combina_elemente([],[],[]).
comb_mat(Nume1,Nume2,M):- matrice(Nume1,M1),matrice(Nume2,M2),comb_mat_aux(M1,M2,M). comb_mat_aux([Linie1|M1],[Linie2|M2], [LinieR|MR]):- combina_elemente(Linie1,Linie2,LinieR), comb_mat_aux(M1,M2,MR).
comb_mat_aux([],[],[]).
