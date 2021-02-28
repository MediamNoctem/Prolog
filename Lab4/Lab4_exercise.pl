% 1
read_list(0,[]):-!.
read_list(N,[Head|Tail]):- read(Head), N1 is N-1, read_list(N1,Tail).

write_list([]):-!.
write_list([Head|Tail]):- write(Head), nl, write_list(Tail).

% 2
sum_list_down([Head|Tail],Summ):- sum_list_down([Head|Tail],0,Summ).
sum_list_down([],Summ,Summ):-!.
sum_list_down([Head|Tail],S,Summ):- S1 is S + Head, sum_list_down(Tail,S1,Summ).
pr4_2:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), sum_list_down(List,Summ), write("Summ = "), write(Summ).

% 3	
sum_list_up([],0):-!.
sum_list_up([Head|Tail],Summ):- sum_list_up(Tail,S1), Summ is Head + S1.

% 4
list_el_numb(List,Elem,Number):- list_el_numb(List,Elem,0,Number).
list_el_numb([Head|_],Head,Number,Number):-!.
list_el_numb([_|Tail],Elem,I,Number):- I1 is I+1, list_el_numb(Tail,Elem,I1,Number).

pr4_4:- write("Enter the number: "), read(N), write("Enter the list:"), nl,
	read_list(N,List), write("Enter an item: "), read(Elem), list_el_numb(List,Elem,Number),
	write("Number = "), write(Number),!.
pr4_4:- write("There is no such item in the list.").

% 5
pr4_5:- write("Enter the number: "), read(N), write("Enter the list:"), nl,
	read_list(N,List), write("Enter an item number: "), read(Number), list_el_numb(List,Elem,Number),
	write("Elem = "), write(Elem),!.
pr4_5:- write("The item number is uncorrect.").

% 6
min(X,Y,X):-X<Y,!.
min(_,Y,Y).

min_list_up([Head],Head):-!.
min_list_up([Head|Tail],Min):- min_list_up(Tail,Min1), min(Head,Min1,Min).

% 7
min_list_down([Head|Tail],Min):- min_list_down(Tail,Head,Min).
min_list_down([],M,M):-!.
min_list_down([Head|Tail],M,Min):- min(Head,M,Min1), min_list_down(Tail,Min1,Min).

% 8
pr4_8:- write("Enter the number: "), read(N), write("Enter the list:"), nl,
	read_list(N,List), min_list_down(List,Min), write("Min = "), write(Min).

% 9
in_list([El|_],El):-!.
in_list([_|Tail],El):- in_list(Tail,El).

% 10
reverse_list([],List):- reverse_list([],[],List),!.
reverse_list([Head|Tail],List):- reverse_list([Head|Tail],[],List).
reverse_list([],List1,List1):-!.
reverse_list([Head|Tail],List_r, List):- reverse_list(Tail,[Head|List_r],List).

% 11
p(Sublist,List):- p(Sublist,List,0).
p([],_,1):-!.
p(Sublist,[],0):- Sublist\=[], false, !.
p([Head1|Tail1],[Head2|Tail2],_):- (Head1 = Head2 -> p(Tail1,Tail2,1); p([Head1|Tail1], Tail2,0)).

% 12
delete_elem_num([_|Tail],0,Tail):- !.
delete_elem_num([Head|Tail1],Num,[Head|Tail2]):- Num1 is Num-1, delete_elem_num(Tail1,Num1,Tail2).

% 13
delete_all(List,Elem,List_res):- (list_el_numb(List,Elem,Num) -> 
	delete_elem_num(List,Num,List1), delete_all(List1,Elem,List_res); List_res = List).
	
% 14
pr4_14([]):-!.
pr4_14([Head|Tail]):- (in_list(Tail,Head) -> fail, !; pr4_14(Tail)).

% 15
pr4_15([],[]).
pr4_15([Head|Tail1],[Head|Tail2]):- delete_all(Tail1,Head,List1), pr4_15(List1,Tail2).

