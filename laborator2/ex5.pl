% all_a() verifica daca o lista e formata numai din a-uri
all_a([a]).
all_a([a | Rest]) :- all_a(Rest).

all_a2([a]).
all_a2([H|Tail]) :- H==a, all_a2(Tail).

% traduce o lista de a-uri in b-uri
trans_a_b([], []).
trans_a_b([a|RestA], [b|RestB]) :- trans_a_b(RestA, RestB).

% fiecare element al listei de pe pozitia doi e inmultita cu X, fiind
% alcatuita o lista auxiliara a valorilor obt in urma inmultirii
% intregilor cu scalari
scalarMult(X, [], []).
scalarMult(X, [Elem | L1], [Y | L2]) :- Y is Elem * X, scalarMult(X, L1, L2).

% Rezfin = l1[i] * l2[i] alt produs scalar
dot([],[],0).
dot([X|L1], [Y|L2], Rezfin) :- dot(L1, L2, Rpart), Rezfin is X*Y+Rpart.

% elementul maxim dintr-o lista si il returneaza in al doilea parametru
% var 1; Y e maximul curent, care va primi head-ul listei numai daca
% acest element e mai mare decat maximul obtinut pana la acel moment
max([], 0).
max([H|T], Y) :- max(T,Y), Y>=H.
max([H|T], H) :- max(T,Y), H>Y.

%var 2
max2([],0).
max2([H|T],X) :- max2(T,Y), maxim(H,Y,X).
maxim(A,B,B) :- B>A.
maxim(A,B,A) :- A>=B.
