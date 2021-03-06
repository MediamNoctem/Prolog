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

% 16
list_num_count([],_,0):-!.
list_num_count([Head|Tail],Num,Count):- list_num_count(Tail,Num,C1),(Head = Num -> Count is C1+1; Count is C1).

% 17
length_list(List,Count):- length_list(List,0,Count).
length_list([],C,C):-!.
length_list([_|Tail],C,Count):- C1 is C+1, length_list(Tail,C1,Count).

% 18_11
p11:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), p11(List,Elem), write("Elem = "), write(Elem).

p11([Head|Tail],Elem):- list_num_count(Tail,Head,C), (C > 0 -> delete_all(Tail,Head,List1), p11(List1,Elem); Elem = Head, !).

% 18_12
p12:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), p12(List,List1), nl, write("List:"), nl, write_list(List1).

max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max_list([Head|Tail],Max):- max_list(Tail,Head,Max).
max_list([],M,M):-!.
max_list([Head|Tail],M,Max):- max(Head,M,Max1), max_list(Tail,Max1,Max).

append_list([],List2,List2).
append_list([H|T1],List2,[H|T2]):- append_list(T1,List2,T2).

cut_sublist(_,_,0,[]):-!.
cut_sublist([H|T1],P1,P2,[H|T2]):- P1<0, P2>0, P_1 is P1-1, P_2 is P2-1, cut_sublist(T1,P_1,P_2,T2),!.
cut_sublist([_|T1],P1,P2,List):- P_1 is P1-1, P_2 is P2-1, cut_sublist(T1,P_1,P_2,List),!.

p12(List1,List2):- min_list_down(List1,Min),max_list(List1,Max), p12(List1,Min,Max,[],List2).

p12(List1,Min,Max,List_res,List2):- (list_el_numb(List1,Min,P1) ->
	P2 is P1+1, cut_sublist(List1,-1,P2,List_res_1), length_list(List1,P3),
	cut_sublist(List1,P1,P3,Sublist1),
	(list_el_numb(Sublist1,Max,P4) -> 
	cut_sublist(Sublist1,-1,P4,Sublist2), reverse_list(Sublist2,List_rev), 
	append_list(List_res,List_res_1,List_res1),
	append_list(List_res1,List_rev,List_res3), append_list(List_res3,[Max],List_res2),
	P5 is P4+P1+1,
	cut_sublist(List1,P5,P3,List_1), p12(List_1,Min,Max,List_res2,List2);
	append_list(List_res_1,Sublist1,List2));
	append_list(List_res,List1,List2)).

% 18_22
p22:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), write("Enter A:"), nl, read(A), write("Enter B:"), nl, 
	read(B), p22(List,A,B,Count), write("Count = "), write(Count).
	
min_ab([H|T], A, B, Min):- (H>A, H<B -> min_ab(T, A, B, H, Min); min_ab(T, A, B, Min)),!.
min_ab([],_, _, M, M):-!.
min_ab([H|T],A, B, M, Min):- (H>A, H<B -> min(H, M, M1), min_ab(T, A, B, M1, Min); min_ab(T, A, B, M, Min)),!.

p22(List,A,B,Count):- min_ab(List,A,B,Min), p22_1(List,Min,0,Count),!.
p22_1([],_,C,C):-!.
p22_1([H|T],Min,C,Count):- (H = Min -> C1 is C+1; C1 is C), p22_1(T,Min,C1,Count),!.

% 18_24
p24:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), p24(List,Max1,Max2), write("Max1 = "), write(Max1), nl,
	write("Max2 = "), write(Max2).

p24([Head|Tail],Max1,Max2):- p24(Tail,Head,_,Max1,Max2,0), !.
p24([],Max1,Max2,Max1,Max2,_):- !.
p24([Head|Tail],Max1,_,M1,M2,0):- (Head =< Max1 -> p24(Tail,Max1,Head,M1,M2,1); 
	p24(Tail,Head,Max1,M1,M2,1)).
p24([Head|Tail],Max1,Max2,M1,M2,1):- (Head > Max2, Head =< Max1 -> p24(Tail,Max1,Head,M1,M2,1);
	(Head > Max1 -> p24(Tail,Head,Max1,M1,M2,1); p24(Tail,Max1,Max2,M1,M2,1))).

% 18_33
p33:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), p33(List).

p33([Head|Tail]):- (Head > 0 -> T = 1; (Head < 0 -> T = 0; fail)), p33(Tail,T).
p33([],_):-!.
p33([Head|Tail],0):- Head > 0, p33(Tail,1),!.
p33([Head|Tail],1):- Head < 0, p33(Tail,0),!.

% 18_36
p36:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), p36(List,Odd_max), nl, write("Odd_max = "), write(Odd_max).

p36([Head|Tail], Odd_max):- (0 is Head mod 2 -> p36(Tail,Odd_max); p36(Tail,Head,Odd_max)).
p36([],M,M):-!.
p36([Head|Tail],M,Odd_max):- Mm is Head mod 2, (Head > M, Mm\=0 -> p36(Tail,Head,Odd_max); p36(Tail,M,Odd_max)).

% 18_42
p42:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), p42(List,List1), nl, write("List:"), nl, write_list(List1).

sr_arifm(List,Sr):- sum_list_down(List,Sum), length_list(List,Count), Sr is Sum/Count.

p42(List1,List2):- sr_arifm(List1,Sr), p42(List1,Sr,List2).
p42([],_,[]):-!.
p42([Head|Tail1],Sr,[Head|Tail2]):- Head < Sr, p42(Tail1,Sr,Tail2),!.
p42([_|Tail1],Sr,List2):- p42(Tail1,Sr,List2),!.

% 18_48
p48:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), p48(List,List1), nl, write("List:"), nl, write_list(List1).

num_count_max([Head|Tail],Elem):- list_num_count([Head|Tail],Head,P),
	num_count_max([Head|Tail],Head,P,Elem).
num_count_max([],N,_,N):-!.
num_count_max([Head|Tail],N,P,Elem):- list_num_count([Head|Tail],Head,P1),
	(P1 > P -> num_count_max(Tail,Head,P1,Elem); num_count_max(Tail,N,P,Elem)).
	
p48(List1,List2):- num_count_max(List1,Elem), p48(List1,0,Elem,List2).
p48([],_,_,[]):-!.
p48([Head|Tail1],I,Elem,[I|Tail2]):- Head = Elem, I1 is I+1, p48(Tail1,I1,Elem,Tail2),!.
p48([_|Tail1],I,Elem,List2):- I1 is I+1, p48(Tail1,I1,Elem,List2),!.

% 18_60
p60:- write("Enter the number:"), nl, read(N), write("Enter the list:"), nl, 
	read_list(N,List), p60(List,List1), nl, write("List:"), nl, write_list(List1).
p60(List1,List2):- p60(List1,List1,List2).
p60(_,[],[]):-!.
p60(List1,[H|T1],[H|T2]):- list_num_count(List1,H,P), P=1, list_el_numb(List1,H,N), 
	N \= 0, 0 is H mod N, p60(List1,T1,T2),!.
p60(List1,[_|T],List3):- p60(List1,T,List3).
