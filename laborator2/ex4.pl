element_of(Elem,[Elem|_]).
element_of(Elem,[_|Tail]) :- element_of(Elem,Tail).
% verifica daca x apartine unei liste
% stiind ac o lista contine un head si tail
% x poate fi de 2 tipuri: fie primul element, fie unul dintre
% urmatoarele ce alcatuiesc partea de Tail

concat_lists([], List, List).
concat_lists([Elem | List1], List2, [Elem | List3]) :- concat_lists(List1, List2, List3).
% al treilea argument este concatenarea listelor date ca prime doua
% argumente
