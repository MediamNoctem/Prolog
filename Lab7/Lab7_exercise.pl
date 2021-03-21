write_list([]):-!.
write_list([Head|Tail]):- write(Head), nl, write_list(Tail).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

% 1
p1:- read_str(List,Length), write_str(List), write(", "), write_str(List),
	write(", "), write_str(List), nl, write("Length = "), write(Length).

% 2
p2:- read_str(List,_), append([32], List, List1), count_words(List1,0,K),
	(K\=0 -> write("Number of words = "), write(K); write("Empty!")),!.

count_words([],K,K):-!.
count_words([32,H2|T],I,K):- H2\=32, H2\=10, I1 is I+1, count_words(T,I1,K).
count_words([_|T],I,K):- count_words(T,I,K),!.

% 3
p3:- read_str(List,_), freq_word(List,Freq_word), write("Word = "),
	write_str(Freq_word).

in_list([El|_],El):-!.
in_list([_|T],El):-in_list(T,El).

% Извлекаем слово из списка. В начале не должно быть пробела.
% get_word(+List, Word).

get_word([32|_],[]):- !.
get_word([H|T1],[H|T2]):- H\=32, get_word(T1,T2),!.

% Считаем, сколько раз слово встречается в списке. В конце списка должен быть пробел.
% num_word(+List,+Word,+Current_number[=0],Number).

num_word([],_,I,I):-!.
num_word([32|T],Word,I,C):- delete_space(T,List),
	num_word(List,Word,I,C), !.
num_word(List,Word,I,C):- get_word(List,W), delete_fword(List,L),
	(W = Word -> I1 is I+1; I1 is I), num_word(L,Word,I1,C).

append_list([],List2,List2).
append_list([H|T1],List2,[H|T2]):- append_list(T1,List2,T2).

delete_space([32|T],List):- delete_space(T,List),!.
delete_space(List,List).

% Удаление первого слова. В начале не должно быть пробела.
% В конце списка должен быть пробел.
delete_fword([H|T1],List):- H\=32, delete_fword(T1,List),!.
delete_fword([32|T],T):-!.

% Ищем самое часто встречающееся слово в списке.
% freq_word(+List,Freq_word).

freq_word(List,Freq_word):- delete_space(List,L), append_list(L,[32],Source_list),
	freq_word(Source_list,Source_list,[],0,Freq_word).
freq_word(_,[],Word,_,Word):-!.
freq_word(Source_list,Changing_list,Current_word,Num,Freq_word):-
	get_word(Changing_list,Cur), num_word(Source_list,Cur,0,I),
	delete_fword(Changing_list, List), delete_space(List,Changed_list),
	(I > Num -> freq_word(Source_list,Changed_list,Cur,I,Freq_word);
	freq_word(Source_list,Changed_list,Current_word,Num,Freq_word)).

% 4
p4:- read_str([H|T],L), (L>5 -> p4_1([H|T],0,L); p4_2(H,L)).

p4_1([],_,_):-!.
p4_1([H|T],I,L):- I<3, write_str([H]), I1 is I+1, p4_1(T,I1,L),!.
p4_1([H|T],I,L):- M is L-I, M<4, write_str([H]), I1 is I+1, p4_1(T,I1,L),!.
p4_1([_|T],I,L):- I1 is I+1, p4_1(T,I1,L).

p4_2(_,0):-!.
p4_2(H,L):- write_str([H]), L1 is L-1, p4_2(H,L1).

% 5
p5:- read_str(List,L), reverse_list(List,[H|T]), p5([H|T],List1,H,0,L),
	write_list(List1).

reverse_list([],List):- reverse_list([],[],List),!.
reverse_list([Head|Tail],List):- reverse_list([Head|Tail],[],List).
reverse_list([],List1,List1):-!.
reverse_list([Head|Tail],List_r, List):- reverse_list(Tail,[Head|List_r],List).

p5([],[],_,_,_):-!.
p5([H1|T1],[H2|T2],H1,I,L):- H2 is L-I-1, I1 is I+1, p5(T1,T2,H1,I1,L),!.
p5([_|T1],List,H,I,L):- I1 is I+1, p5(T1,List,H,I1,L).

% 6
p6:- read_str(List,_), p6(List,0,List1), write_str(List1).

p6([],_,[]):-!.
p6([H|T1],I,[H|T2]):- 0 is I mod 3, I\=0, I1 is I+1, p6(T1,I1,T2),!.
p6([_|T1],I,List):- I1 is I+1, p6(T1,I1,List).

% 7
p7:- read_str(List,_), p7(List,0,0,I,C), write("I = "), write(I), write(","), nl, 
	write("C = "), write(C), write(".").

p7([],I,C,I,C):-!.
p7([H1,H2|T],I,C,I0,C0):- (H1 = 43; H1 = 45), I1 is I+1,
	(H2 = 48 -> C1 is C+1, p7(T,I1,C1,I0,C0); p7([H2|T],I1,C,I0,C0)),!.
p7([H|T],I,C,I0,C0):- (H = 43; H = 45), I1 is I+1, p7(T,I1,C,I0,C0),!.
p7([_|T],I,C,I0,C0):- p7(T,I,C,I0,C0).

% 8
p8:- read_str(List,_), 
	(in_list(List,119) -> 
		(in_list(List,120) -> p8(List,119,C1), 
			(C1\=[] -> write_str([C1]), write(" occurs before w."); 
			write("w is at beginning of the string.")), 
		nl, p8(List,120,C2), 
			(C2\=[] -> write_str([C2]), write(" occurs before x."); 
			write("x is at beginning of the string.")); 
		write("x not found."), nl, p8(List,119,C1), 
			(C1\=[] -> write_str([C1]), write(" occurs before w."); 
			write("w is at beginning of the string.")));
	write("w not found."), nl,
		(in_list(List,120) -> p8(List,120,C1), 
			(C1\=[] -> write_str([C1]), write(" occurs before x."); 
			write("x is at beginning of the string.")); 
		write("x not found."))).

p8([H1,H2|_],H1,[]):- H2\=H1,!.
p8([C,H|_],H,C):-!.
p8([_|T],H,C):- p8(T,H,C).

% 9
p9:- write("Enter the first string."), nl, read_str(List1,L1), 
	write("Enter the second string."), nl, read_str(List2,L2), 
	(L1>L2 -> M is L1-L2, p9(List1,M); M is L2-L1, p9(List2,M)).

p9(_,0):-!.
p9(List,M):- write_str(List), nl, M1 is M-1, p9(List,M1).

% 10
p10:- read_str(List,_), 
	(p10(List,L1) -> write_str(L1); 
	append_list(List,[122,122,122],L2), write_str(L2)).
	
p10([97,98,99|T],[119,119,119|T]):-!.

% 11
p11:- read_str(List,L), (L>10 -> p11_1(List,List1), write_str(List1);
	p11_2(List,List2,L), write_str(List2)).

p11_1([H1,H2,H3,H4,H5,H6|_],[H1,H2,H3,H4,H5,H6]):-!.
p11_2(List,List,12):-!.
p11_2(List,List_1,L):- L1 is L+1, append_list(List,[111],List1), p11_2(List1,List_1,L1).

% 13
p13:- read_str(List,_), p13(List,List1,0), write_str(List1).

p13([],[],_):-!.
p13([97|T1],[99|T2],I):- 0 is I mod 2, I1 is I+1, p13(T1,T2,I1),!.
p13([98|T1],[99|T2],I):- 0 is I mod 2, I1 is I+1, p13(T1,T2,I1),!.
p13([_|T1],[97|T2],I):- 0 is I mod 2, I1 is I+1, p13(T1,T2,I1),!.
p13([H|T1],[H|T2],I):- I1 is I+1, p13(T1,T2,I1).

% 14
p14:- read_str(List,_), count_digits(List,0,K), write("The number of digit = "), write(K).

count_digits([],C,C):-!.
count_digits([H|T],C,K):- H>=48, H=<57, C1 is C+1, count_digits(T,C1,K),!.
count_digits([_|T],C,K):- count_digits(T,C,K).

% 15
p15:- read_str(List,_), (p15(List,0) -> true; false).

p15([],1):-!.
p15([97|T],_):- p15(T,1).
p15([98|T],_):- p15(T,1).
p15([99|T],_):- p15(T,1).

% 16
p16:- read_str(List,_), p16(List,L), write_str(L).

p16([],[]):-!.
p16([119,111,114,100|T1],[108,101,116,116,101,114|T2]):- p16(T1,T2),!.
p16([H|T1],[H|T2]):- p16(T1,T2).

