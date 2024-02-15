% ex1
% lista_puncte/3
lista_puncte([],_,[]).
lista_puncte([punct(X,Y)|L], Val, [punct(X,Y)|Result]) :- Y>=Val, lista_puncte(L, Val, Result).
lista_puncte([punct(_,Y)|L], Val, Result) :- Y<Val, lista_puncte(L, Val, Result).

% exemple:
% ?- lista_puncte([punct(0,4), punct(8,3), punct(2,1), punct(5,5)], 4,
% R).
% R = [punct(0, 4), punct(5, 5)].
% ?- lista_puncte([punct(0,0), punct(7,8), punct(10,9)], 12, R).
% R = [].
%
% explicatie:
% prima linie din program descrie cazul de baza, la care se va ajunge la
% ultimul pas al recursivitatii si indica ca predicatul va returna
% valoarea de adevar cand lista de input devine vida, adica am prelucrat
% toate elementele din ea. de altfel, ultimul parametru reprezinta lista
% rezultata, care e initializata cu lista vida.
%
% a doua linie de cod indica faptul ca fiecare punct de pe pozitia
% curenta (e head-ul listei de input), va fi trecut prin conditia ca
% Y>=Val, apoi daca respecta ac fapt, punctul se va adauga in capul
% listei rezultate. urmeaza apoi un apel recursiv pentru a verifica
% restul elementelor din lista de input.
%
% a treia linie de cod trateaza cazul in care Y<Val, moment in care
% lista rezultata nu va fi modificata, adica punctul nu va fi adaugat la
% aceasta si se continua parcurgerea recursiva.

% ex2
dropN(L, R, N) :- append(R, Rdr, L), length(Rdr, N).

% exemple:
% ?- dropN([u,n,i,b,u,c,1,2,3], R, 3).
% R = [u, n, i, b, u, c] .
% ?- dropN([p,a,r,o,l,a,x,y,z,0], R, 4).
% R = [p, a, r, o, l, a] .
%
% explicatie:
% R este lista care rezulta din eliminarea ultimelor N elemente din
% lista de input, insemnand ca R ar reprezenta subsecventa din extrema
% dreapta a listei mentionate, asadar R impreuna cu o lista auxiliara
% Rdr ar forma L, iar Rdr are lungimea N. length va atribui lungimea N
% lui Rdr, iar append va determina lista R.

% ex3
rmdn(Phi, Phi) :- atom(Phi). % phi e egal cu psi dupa eliminarea non(non())
rmdn(non(Phi), non(Phi)) :- atom(Phi).

rmdn(non(non(Phi)), Psi) :- rmdn(Phi, Psi).% eliminarea negatiei duble din phi

rmdn(non(si(Phi,Psi)),non(A)) :- rmdn(si(Phi,Psi),A).
rmdn(non(sau(Phi,Psi)),non(A)) :- rmdn(sau(Phi,Psi),A).
rmdn(non(imp(Phi,Psi)),non(A)) :- rmdn(imp(Phi,Psi),A).

rmdn(si(Phi, Psi), si(Phi1, Psi1)) :- rmdn(Phi, Phi1), rmdn(Psi, Psi1).
rmdn(sau(Phi, Psi), sau(Phi1, Psi1)) :- rmdn(Phi, Phi1), rmdn(Psi, Psi1).
rmdn(imp(Phi, Psi), imp(Phi1, Psi1)) :- rmdn(Phi, Phi1), rmdn(Psi, Psi1).

