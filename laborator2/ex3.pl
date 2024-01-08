linie(0,_).% cand Y ajunge la 0, nu va mai fisa niciun caracter
linie(X,C) :- X>0, Y is X-1, write(C), linie(Y,C).

triunghi(0,_).
triunghi(X,C) :- X>0, Y is X-1, linie(X,C), nl, triunghi(Y,C).% va afisa diag principala si ce se afla deasupra ei

dreptunghi(0,_,_).
dreptunghi(X,Z,C) :- X>0, Y is X-1, linie(Z,C), nl, dreptunghi(Y,Z,C).
patrat(X,C) :- dreptunghi(X,X,C).

