is_digesting(X,Y) :- just_ate(X,Y).
is_digesting(X,Y) :- just_ate(X,Z), is_digesting(Z,Y).
just_ate(mosquito,blood(john)).
just_ate(frog,mosquito).
just_ate(stork,frog).

/* succ(X) represents the number obtained by adding
one to the number represented by X.*/
numeral(0).
numeral(succ(X)) :- numeral(X).

directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).
in(X, Y) :- directlyIn(X,Y).
in(X, Y) :- directlyIn(X, Z), in(Z, Y).

leaf(Label).
tree(leaf(B1),leaf(B2)) :- tree(B1,B2).
swap(leaf(L),leaf(L)).
swap(tree(LL,LR), tree(RL,RR)):- swap(LR,RL), swap(LL,RR).

/* If we're asked to swap a leaf, we should just return the leaf itself. For
trees, we have to apply swap/2 to their children and swap the results. */
