% listaNelem(L,N,M) este adevarat exact atunci cand M este o lista cu N
% elemente care sunt toate elemente ale lui L

listaNelem(_,0,[]).
listaNelem(L,N,[H|T]) :- N > 0, P is N - 1, member(H,L), listaNelem(L,P,T).

% listeNelem/3 adevarat atunci cand LL este lista tuturor acelor M cu
% proprietatea ca listaNelem(L,N,M)
listeNelem(L,N,LL) :- bagof(M, listaNelem(L,N,M), LL).
% din moment ce M este o lista, ea va fi adaugata la LL, deci in final
% se va afisa o lista de sublista in cazul in care interogarea se refera
% la o variabila de pe pozitia 3
% asadar, ac functor colecteaza toate solutiile posibile pentru M, care
% altfel ar fi trebuit parcurse folosind trace

% L contains all pairs (X, Y) where X which is part of ListX is less
% than Y which is part of ListY
perechi1_noduplicates(ListX, ListY, Lrez) :- bagof((X,Y), (member(X,ListX), member(Y,ListY), X<Y), Pairs), sort(Pairs, Lrez).
perechi1(ListX, ListY, Lrez) :- bagof((X,Y), (member(X,ListX), member(Y,ListY), X<Y), Lrez).

perechi2(ListX, ListY, Lrez) :- findall((X, Y), (member(X,ListX), member(Y,ListY), X<Y), Lrez).
perechi2_noduplicates(ListX, ListY, Lrez) :- findall((X,Y), (member(X,ListX), member(Y,ListY), X<Y), Pairs), sort(Pairs, Lrez).

perechi3(ListX, ListY, Lrez) :- setof((X, Y), (member(X,ListX), member(Y,ListY), X<Y), Lrez). % nu vor exista duplicate implicit
multime(L,M):- setof(X, member(X,L), M).

cond(X,Y,R) :- a(X), a(Y), R is X+Y.
exp_a(L) :- bagof(X+Y=R,(cond(X,Y,R)), L).
mult_exp_a(L) :- setof(X+Y=R, (cond(X,Y,R)), L).

filtrare_pare(Lrez, ValMax) :- findall(X, (numlist(1,ValMax,L), member(X,L), 0 =:= mod(X,2)), Lrez).
%  numlist/3 generates a list of successing integers.
filtrare_divizori(Lrez, ValMax) :- findall(X-Y, (numlist(1,ValMax,L), member(X,L), member(Y,L), X>Y, Y=\=1, 0 =:= mod(X,Y)), Lrez).

word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crosswd(V1,V2,V3,H1,H2,H3) :-
                word(V1,_,A,_,B,_,C,_),
                word(V2,_,D,_,E,_,F,_),
                word(V3,_,G,_,H,_,I,_),
                word(H1,_,A,_,D,_,G,_),
                word(H2,_,B,_,E,_,H,_),
                word(H3,_,C,_,F,_,I,_).
connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X,X,[X]).
path(X,Y,[X|L]) :- connected(X,Z), path(Z,Y,L).

pathc(X,Y) :- path(X,Y,_).



