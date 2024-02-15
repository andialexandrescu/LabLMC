% ex1
consec([]).
consec([_]).
consec([X,Y|T]) :- Y =:= X+1, consec([Y|T]).
% ex2
listare_studenti([],_,[]).
listare_studenti([student(Nume, Nota)|ListaStudenti], PragNota, [Nume|ListareRezultat]) :- Nota<PragNota, listare_studenti(ListaStudenti, PragNota, ListareRezultat).
listare_studenti([student(_, Nota)|ListaStudenti], PragNota, ListareRezultat) :- Nota>=PragNota, listare_studenti(ListaStudenti, PragNota, ListareRezultat).