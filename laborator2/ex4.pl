first_element([First|_],First).
% atunci cand este furnizata o lista ca prim argument, returneaza primul
% element al listei ca al doilea argument

second_element([_, Second|_],Second).
%va returna al doilea element
%fiecare variabila anonima difera una de cealalta

tail([First|Tail],Tail).
%va returna restul listei, cu exceptia primului element

n_th_element([Elem|_],Elem,1).% va returna head-ul listei rezultate cand N==1
n_th_element([_|Tail],Elem,N) :- N>1, NextN is N-1, n_th_element(Tail,Elem,NextN).

last_element(Elem,[Elem]).%lista finala e formata doar din acel element, il va returna
last_element(Elem,[_|Tail]) :- last_element(Elem,Tail).
%ultimul element

last_but_one(X,[X,_]).
last_but_one(X,[_,Y|Ys]) :- last_but_one(X,[Y|Ys]).
% se parcurge lista folosind mereu doi termeni, _ si Y (primii doi
% termeni ai listei curente), la fiecare pas se 'scapa' numai de
% variabila anonima
% penultimul element

cons(Head, Tail, [Head|Tail]).
%va intoarce o lista care reuneste head-ul si tail-ul dorite

member_of(X,[X|_]).%X e chiar head-ul listei, va returna True
member_of(X,[_|T]) :- member_of(X,T).
% verifica daca x apartine unei liste
% stiind ca o lista contine un head si tail
% x poate fi de 2 tipuri: fie primul element, fie unul dintre
% urmatoarele ce alcatuiesc partea de Tail

len_list([],0).
len_list([_|T],N) :- len_list(T, N1), N is N1+1.
% N1 va fi lungimea tail-ului, head-ul e variabila anonima pt ca nu e
% necesara

suma_list([],0).
suma_list([H|T], S) :- suma_list(T, S1), S is S1+H.
% recursiv se trimite o noua lista formata de fiecare data cu un element
% mai putin, acela din head, deoarece se reapeleaza sum_list(Tail, ...)

is_sorted_list([]).% lista vida e sortata cresc
is_sorted_list([_]).% lista cu un elment ramas e sortata
is_sorted_list([X,Y|T]) :- X=<Y, is_sorted_list([Y|T]).

concat_lists([],List,List).% pentru ca prima lista e vida, inseamna ca a concatena [] cu List are ca rezultat tot List
concat_lists([H|TList1],List2,[H|List3]) :- concat_lists(TList1,List2,List3).
% al treilea argument List3 este concatenarea listelor date ca prime
% doua argumente adica head-ul listei1 si ceea ce se obtine ca tail
% al listei3 (de obs ca lista2 nu e prelucrata, isi pastreaza forma ca
% si inainte, din moment ce am decis ca lista2 se alfa la sfarsitul
% listei3)

delete_1st(_,[],[]). % cazul de baza: pt a sterge prima aparitie a unui element oarecare dintr-o lista vida, lista rezultata va ramane lista vida
delete_1st(Elem,[Elem|Tail],Tail).% daca elementul care trebuie sters e chiar head-ul listei, rezultatul va fi tail-ul
delete_1st(Elem,[Head|Tail],[Head|ResultTail]) :- delete_1st(Elem,Tail,ResultTail).

delete_all(_,[],[]).
delete_all(Elem,[Elem|Tail],ResultTail) :- delete_all(Elem,Tail,ResultTail).
delete_all(Elem,[Head|Tail],[Head|ResultTail]) :- Elem\=Head, delete_all(Elem,Tail,ResultTail).

reverse(List,Reversed) :- concat2_lists(List,[],Reversed).
concat2_lists([],List,List).
concat2_lists([HList1|TList1],List2,List3) :- concat2_lists(TList1,[HList1|List2],List3).%recursiv fiecare element din List1 va deveni progresiv head-ul listei2, care apoi va fi preluata total (cand lista1 e lista vida) in lista3, rezultatul inversiunii listei1

%verificare palindrom
is_palindrome(List) :- write(List), write(' este o lista de tip palindrom').
is_palindrome(List) :- reverse(List,List).

my_flatten(X,[X]) :- \+ is_list(X).% daca X nu e o lista (is_list/1 e un predicat predefinit), va fi considerat un element, fiind adaugat la rezultat prin acel [X]
my_flatten([],[]).
my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs).
% Y si Ys deservesc drept variabile auxiliare pentru head-ul X ai listei
% initiale si tail-ul Xs, care apoi sunt concatenate si retinute in Zs
%
% se retine fiecare element dintr-o sublista intr-o alta lista care nu
% va contine marcatorii de subliste; chiar exista un predicat predefinit
% care face acest lucru (flatten/2)
