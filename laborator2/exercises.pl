just_ate(mosquito,blood(john)).
just_ate(frog,mosquito).
just_ate(stork,frog).

is_digesting(X,Y) :- just_ate(X,Y).
is_digesting(X,Y) :- just_ate(X,Z), is_digesting(Z,Y).

/* succ(X) represents the number obtained by adding
one to the number represented by X.*/
numeral(0).%base case
numeral(succ(X)) :- numeral(X).%recursive case

directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).
in(X,Y) :- directlyIn(X,Y).
in(X,Y) :- directlyIn(X,Z), in(Z,Y).

leaf(Label).
tree(leaf(B1),leaf(B2)) :- tree(B1,B2).
swap(leaf(L),leaf(L)).
swap(tree(LL,LR), tree(RL,RR)):- swap(LR,RL), swap(LL,RR).

/* If we're asked to swap a leaf, we should just return the leaf itself. For
trees, we have to apply swap/2 to their children and swap the results. */

square_power(X, Result) :- Result is X * X.
power(0, _, 1). % orice ridicat la puterea 0 este 1
power(P, N, Result) :- P>0, P1 is P-1, power(P1, N, TempResult), Result is N*TempResult.

%hanoi
move(1,X,Y,_) :- write('Move top disk from '), write(X), write(' to '), write(Y), nl.
move(N,X,Y,Z) :- N>1, M is N-1, move(M,X,Z,Y), move(1,X,Y,_), move(M,Z,Y,X).
%cazul de baza: daca n = 1, muta discul de pe X pe Y.
%pasul recursiv:
%1.muta primele n-1 discuri de pe X pe a treia tija (Z).
%2. muta discul de jos de pe X pe Y.
%3. muta primele n-1 discuri de pe a treia tija (Z) pe Y.

factorial_1(1,1).%factorial de 1 este 1 (returneaza 1 pentru a doua variabila din predicat)
factorial_1(N,F) :- N>1, NN is N-1, factorial_1(NN,FF), F is N*FF.
% se obs ca variabila FF, care este returnata de la nivelul inferior,
% este utilizata la nivelul superior in compunerea lui F (F is N*FF)

factorial_2(1,F,F).
factorial_2(N,T,F) :- N>1, TT is N*T, NN is N-1, factorial_2(NN,TT,F).
factorial_2(N,F) :- factorial_2(N,1,F).
% T si TT stocheaza inmultiri partiale (neaparat in query T trebuie sa
% fie initializat cu 1) -> mereu e cunoscut un rezultat partial (la var
% 1 se merge in adancime pana la cazul 1!=1 si se reconstituie F)

byCar(auckland, hamilton).
byCar(hamilton, raglan).
byCar(valmont, saarbruecken).
byCar(valmont, metz).

byTrain(metz, frankfurt).
byTrain(saarbruecken, frankfurt).
byTrain(metz, paris).
byTrain(saarbruecken, paris).

byPlane(frankfurt, bangkok).
byPlane(frankfurt, singapore).
byPlane(paris, losAngeles).
byPlane(bangkok, auckland).
byPlane(losAngeles, auckland).

route(X,Y) :- byCar(X,Y); byTrain(X,Y); byPlane(X,Y).%cazul de baza: conexiune directa - SAU
travel(X,Y) :- travel(X,Y,[]).% la query nu dorim a specifica si initializa o lista vida (vrem o aritate de 2)
travel(X, Y, ListVisited) :- route(X, Z), \+ member(Z, ListVisited), travel(Z, Y, [X | ListVisited]).
% Z reprez locatia intermediara: X->Z->Y (exista o ruta de la X la Z, Z
% fiind o locatie nevizitata), urmeaza a fi parcurs un drum recursiv
% care are ca urmator pas Z->Y->T..., iar intotdeauna
% head-ul (X) va fi concatenat la lista ListVisited
travel(X,Y,ListVisited) :- route(X, Y), reverse([Y|ListVisited], ReversedRoute), write('Route: '), write(ReversedRoute), nl.
% abia cand s-a gasit ruta de la X si Y tastate ca input la query, se va
% afisa in ce a constat aceasta (trebuie reversed din cauza modului in
% care ListVisited e construita)

