write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

% 1_1
p1_1:- see('c:/Users/Anastasia/Desktop/p1_in.txt'), read_list_str(_, LengthList), 
	seen, max(LengthList, Max), write(Max).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
	read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

% 1_2
p1_2:- see('c:/Users/Anastasia/Desktop/p1_in.txt'), read_list_str_space(_, C), 
	seen, write("C = "), write(C).

read_str_symbol(A,Count,S,Flag):- get0(X), r_str_symbol(X,A,[],Count,0,S,Flag).
r_str_symbol(-1,A,A,Count,Count,_,1):-!.
r_str_symbol(10,A,A,Count,Count,_,0):-!.
r_str_symbol(X,A,B,Count,C,S,Flag):- append(B,[X],B1), get0(X1),
	(X = S -> C1 is C+1; C1 is C), r_str_symbol(X1,A,B1,Count,C1,S,Flag).

read_list_str_space(List, C):- read_str_symbol(A,Count,32,Flag), 
	(Count = 0 -> C1 = 1; C1 = 0), read_list_str_space([A],List,C1,C,Flag).
	
read_list_str_space(List,List,C,C,1):-!.

read_list_str_space(Cur_list,List,CurC,C,0):-
	read_str_symbol(A,Count,32,Flag), append(Cur_list,[A],C_l),
	(Count = 0 -> C1 is CurC+1; C1 is CurC),
	read_list_str_space(C_l,List,C1,C,Flag).
	
% 1_3
p1_3:- see('c:/Users/Anastasia/Desktop/p1_in.txt'), count_A(_,N,C), M is C/N, 
	 seen, see('c:/Users/Anastasia/Desktop/p1_in.txt'), read_list_str_A(_,M), seen.
	
count_A(List,N,C):- read_str_symbol(_,Count,65,Flag), 
	N1 = 1, count_A(List,N1,N,Count,C,Flag).
count_A(_,N,N,C,C,1):-!.
count_A(List,CurN,N,CurC,C,0):- read_str_symbol(_,Count,65,Flag), 
	C1 is CurC + Count, N1 is CurN + 1, 
	count_A(List,N1,N,C1,C,Flag).
	
read_list_str_A(List, M):- read_str_symbol(A,Count,65,Flag), 
	(Count > M -> write_str(A), nl; true), read_list_str_A(List,M,Flag).
	
read_list_str_A(_,_,1):-!.

read_list_str_A(List,M,0):-
	read_str_symbol(A,Count,65,Flag), (Count > M -> write_str(A),nl; true),
	read_list_str_A(List,M,Flag).
	
	
