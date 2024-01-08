vertical(line(point(X,Y1),point(X,Y2))).
horizontal(line(point(X1,Y),point(X2,Y))).

f(a).
f(b).
g(a).
g(b).
h(b).
k(X) :- f(X),g(X),h(X).
