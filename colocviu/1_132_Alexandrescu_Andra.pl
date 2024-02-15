% ex1
% removeOdd(+L, ?R)
removeOdd([],[]).
removeOdd([X],[X]).
removeOdd([X,_|L], [X|R]) :- removeOdd(L, R).
% exemple:
% ?- removeOdd([9, 5, 4, 2, 9, 10], Result).
% Result = [9, 4, 9].
% ?- removeOdd([p,a,r,o,l,a,1,2], Result).
% Result = [p, r, l, 1].
%
% explicatie:
% pentru a stabili cazurile de baza cuprinse pe primele doua linii, vom
% considera faptul ca L, lista de intrare, poate avea lungime para sau
% impara, insemand ca lista rezultata, R, va trebui sa adauge ultimul
% element daca lugimea listei este impara (ultimul element e pe o
% pozitie impara), altfel nu il va adauga (cand lungimea listei este
% para, ultimul element e pe o pozitie para).
% a treia linie din program face parcurgerea listei de input cu primele
% doua elemente din ea, in mod succesiv, urmand a continua sa fie
% parcursa cu urmatoarele doua, motiv pentru care elementul de pe
% pozitie impara care va fi adaugat la R va fi mereu primul, adica este
% X din lista [X|Y|TListaInput].
%
% ex 2
mergePts([],[],[]).
mergePts([],[A],[A]).
mergePts([A],[],[A]).
mergePts([p(Xa,Ya)|L1], [p(Xb,Yb)|L2], [p(Xa,Ya)|R]) :- ((Xa<Xb); (Xa==Xb, Ya<Yb)), mergePts(L1, [p(Xb,Yb)|L2], R).% p(Xa,Ya)<p(Xb,Yb)
mergePts([p(Xa,Ya)|L1], [p(Xb,Yb)|L2], [p(Xb,Yb)|R]) :- ((Xa>Xb); (Xa==Xb, Ya>Yb)), mergePts([p(Xa,Ya)|L1], L2, R).% p(Xa,Ya)>p(Xb,Yb)
mergePts([p(Xa,Ya)|L1], [p(Xb,Yb)|L2], [p(Xa,Ya), p(Xa,Ya)|R]) :- (Xa==Xb, Ya==Yb), mergePts(L1, L2, R).% p(Xa,Ya)==p(Xb,Yb)
% exemple:
% ?- mergePts([p(1,5), p(2,3), p(2,5)], [p(1,3), p(2,4), p(4,0)], R).
% R = [p(1, 3), p(1, 5), p(2, 3), p(2, 4), p(2, 5), p(4, 0)] .
% ?- mergePts([p(0,0), p(6,8)], [p(1,2), p(2,4), p(6,8),
% p(11,21)], R).
% R = [p(0, 0), p(1, 2), p(2, 4), p(6, 8), p(6, 8), p(11, 21)] .
%
% explicatie:
% primele trei linii se refera la cazul de baza care trebuie luat in
% considerare: 1. daca ambele liste de intrare au aceeasi lungime, vor
% ajunge dupa parcurgere ambele sa fie liste vide; 2.+3. daca listele au
% lungimi diferite, una va ramane cu niste elemente in plus, care vor fi
% adaugate la lista rezultata R.
% urmatoarele trei linii din program se refera la cazurile in care un
% punct p(Xa,Ya), corespunzator listei L1 este mai mic, mai mare sau
% egal cu punctul p(Xb,Yb) din lista L2, iar de fiecare data punctul cel
% mai mic va fi adaugat la R (in cazul in care punctele sunt egale, ele
% sunt adaugate in acelasi timp la R).
