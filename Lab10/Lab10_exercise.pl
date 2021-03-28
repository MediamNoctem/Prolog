read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

% 1_1
p1_1:- see('c:/Users/Anastasia/Desktop/p1_in.txt'), read_list_str(List), 
	seen, make_list_edges(List,0,0,E), length(E,N), make_edge_graph(E,E,N,M), 
	write_matrix(M).

make_list_edges([_],_,_,[]):-!.
make_list_edges([[]|T],I_row,_,L):- I1 is I_row+1, make_list_edges(T,I1,0,L),!.
make_list_edges([[49|T1]|T2],I_row,I_column,[[I_row,I_column]|T3]):- I_row < I_column,
	I1 is I_column+1, make_list_edges([T1|T2],I_row,I1,T3),!.
make_list_edges([[H|T1]|T2],I_row,I_column,L):- (I_row > I_column; H = 48),
	I1 is I_column+1, make_list_edges([T1|T2],I_row,I1,L),!.

write_matrix([]):-!.
write_matrix([H|T]):- write(H), nl, write_matrix(T).

make_edge_graph([],_,_,[]):-!.
make_edge_graph([Edge|T1],E,N,[S|T2]):- make_list(Str,N),
	make_string_matrix_edge(E,Edge,E,Num_1), put_1_and_0(Str,Num_1,0,S),
	make_edge_graph(T1,E,N,T2).

make_string_matrix_edge(_,_,[],[]):-!.
make_string_matrix_edge(E,[E1,E2],[[E1,H]|T1],[N|T2]):- H \= E2, 
	list_el_numb(E,[E1,H],N), make_string_matrix_edge(E,[E1,E2],T1,T2),!.
	
make_string_matrix_edge(E,[E2,E1],[[H,E1]|T1],[N|T2]):- H \= E2, 
	list_el_numb(E,[H,E1],N), make_string_matrix_edge(E,[E2,E1],T1,T2),!.
	
make_string_matrix_edge(E,[E1,E2],[[H,E1]|T1],[N|T2]):- H \= E2, 
	list_el_numb(E,[H,E1],N), make_string_matrix_edge(E,[E1,E2],T1,T2),!.
	
make_string_matrix_edge(E,[E2,E1],[[E1,H]|T1],[N|T2]):- H \= E2, 
	list_el_numb(E,[E1,H],N), make_string_matrix_edge(E,[E2,E1],T1,T2),!.
	
make_string_matrix_edge(E,Edge,[_|T],L):- make_string_matrix_edge(E,Edge,T,L).

put_1_and_0([],_,_,[]):-!.
put_1_and_0([1|T1],[I|T2],I,[1|T3]):- I1 is I+1, put_1_and_0(T1,T2,I1,T3),!.
put_1_and_0([0|T1],Num_1,I,[0|T2]):- I1 is I+1, put_1_and_0(T1,Num_1,I1,T2).

list_el_numb(List,Elem,Number):- list_el_numb(List,Elem,0,Number).
list_el_numb([Head|_],Head,Number,Number):-!.
list_el_numb([_|Tail],Elem,I,Number):- I1 is I+1, list_el_numb(Tail,Elem,I1,Number).

make_list([],0):-!.
make_list([_|T],I):- I1 is I-1, make_list(T,I1).
