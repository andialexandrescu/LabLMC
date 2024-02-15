% ex1
consec([]).
consec([_]).
consec([X,Y|T]) :- Y =:= X-1, consec([Y|T]).
% ex2
listare_angajati([],_,[]).
listare_angajati([angajat(Nume, Salariu)|ListaAngajati], PragSalariu, [Nume|ListareRezultat]) :- Salariu>PragSalariu, listare_angajati(ListaAngajati, PragSalariu, ListareRezultat).
listare_angajati([angajat(_, Salariu)|ListaAngajati], PragSalariu, ListareRezultat) :- Salariu=<PragSalariu, listare_angajati(ListaAngajati, PragSalariu, ListareRezultat).
