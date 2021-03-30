read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

% 1_1
p1_1:- see('c:/Users/Anastasia/Desktop/p1_in.txt'), read_list_str(Matrix), 
	seen, convert_matrix(Matrix,List),
	make_list_edges(List,0,0,E), length(E,N), make_edge_graph(E,E,N,M), 
	write_matrix(M).

make_list_edges([_],_,_,[]):-!.
make_list_edges([[]|T],I_row,_,L):- I1 is I_row+1, make_list_edges(T,I1,0,L),!.
make_list_edges([[H|T1]|T2],I_row,I_column,[[I_row,I_column]|T3]):- H\=0,
	I_row < I_column, I1 is I_column+1, make_list_edges([T1|T2],I_row,I1,T3),!.
make_list_edges([[H|T1]|T2],I_row,I_column,L):- (I_row > I_column; H = 0),
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

list_el_numb(List,Elem,Number):- list_el_numb(List,Elem,0,Number),!.
list_el_numb([Head|_],Head,Number,Number):-!.
list_el_numb([_|Tail],Elem,I,Number):- I1 is I+1, list_el_numb(Tail,Elem,I1,Number),!.

make_list([],0):-!.
make_list([_|T],I):- I1 is I-1, make_list(T,I1).

% 1_2
p1_2:- see('c:/Users/Anastasia/Desktop/p1_in.txt'), read_list_str(M), seen, 
	% Преобразуем матрицу кодов в матрицу чисел.
	convert_matrix(M,List),
	% Строим нулевую матрицу потока.
	list_el_numb(List,H,0), length(H,N), make_list(Str,N), 
	put_1_and_0(Str,[],0,Str0), make_matrix_0(Str0,N,CurMatrix_flow),
	% Ищем исток и сток.
	find_source(List,0,0,N,Source), find_drain(List,0,Drain),
	% Ищем последнее ребро по весу из истока.
	list_el_numb(List,Elem,Source), reverse_list(Elem,L_1),
	find_last_edge_from_source(L_1,0,L), S is N-L-1,
	% Составляем список ребер по исходной матрице и сортируем его.
	make_list_edges(List,0,0,Edges), sort(Edges,E),
	% Ищем все возможные пути.
	find_way(E,[],Source,-1,Drain,S,ListWays),
	% Строим полный поток.
	build_full_flow(ListWays,List,CurMatrix_flow,Matrix_full_flow),
	write_matrix(Matrix_full_flow).

convert_matrix([],[]):-!.
convert_matrix([[]|T1],[[]|T2]):- convert_matrix(T1,T2),!.
convert_matrix([[H|T1]|T2],[[D|T3]|T4]):- D is H-48, convert_matrix([T1|T2],[T3|T4]).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

% build_full_flow(List_ways,Source_matrix,Matrix_flow,Matrix_full_flow).

build_full_flow([],_,Matrix_flow,Matrix_flow):-!.
build_full_flow([Way|T],Source_matrix,Matrix_flow,Matrix_full_flow):-
	select_lists(Way,0,0,Source_matrix,Matrix_flow,List_throughput,List_flow),
	build_flow_for_way(List_throughput,List_flow,List_full_flow),
	change_matrix(Way,List_full_flow,0,0,Matrix_flow,CurMatrix_flow),
	build_full_flow(T,Source_matrix,CurMatrix_flow,Matrix_full_flow).

% Выделяем для указанного пути список пропускных способностей и потока.
select_lists([],_,_,_,_,[],[]):-!.

select_lists([[V1,V2]|T1],V1,V2,[[C]|T3],[[F]|T5],[C|T6],[F|T7]):-
	I1 is V1+1, select_lists(T1,I1,0,T3,T5,T6,T7),!.

select_lists([[V1,V2]|T1],V1,V2,[[C|T2]|T3],[[F|T4]|T5],[C|T6],[F|T7]):-
	I2 is V2+1, select_lists(T1,V1,I2,[T2|T3],[T4|T5],T6,T7),!.

select_lists(List_way,I_row,_,[[]|T1],[[]|T2],List_throughput,List_flow):-
	I1 is I_row+1, select_lists(List_way,I1,0,T1,T2,List_throughput,List_flow),!.

select_lists(List_way,I_row,I_column,[[_|T1]|T2],[[_|T3]|T4],List_throughput,List_flow):-
	I2 is I_column+1, 
	select_lists(List_way,I_row,I2,[T1|T2],[T3|T4],List_throughput,List_flow).

% change_matrix(List_way,List_full_flow,I_row,I_column,CurMatrix_flow,Matrix_flow).
change_matrix(_,_,_,_,[],[]):-!.

change_matrix([[V1,V2]|T1],[F|T2],V1,V2,[[[]|T3]|T4],[[F|T5]|T6]):-
	I1 is V1+1, change_matrix(T1,T2,I1,0,[T3|T4],[T5|T6]),!.

change_matrix([[V1,V2]|T1],[F|T2],V1,V2,[[_|T3]|T4],[[F|T5]|T6]):-
	I2 is V2+1, change_matrix(T1,T2,V1,I2,[T3|T4],[T5|T6]),!.

change_matrix(List_way,List_full_flow,I_row,_,[[]|T1],[[]|T2]):-
	I1 is I_row+1, 
	change_matrix(List_way,List_full_flow,I1,0,T1,T2),!.

change_matrix(List_way,List_full_flow,I_row,I_column,[[C|T1]|T2],[[C|T3]|T4]):-
	I2 is I_column+1, 
	change_matrix(List_way,List_full_flow,I_row,I2,[T1|T2],[T3|T4]).

build_flow_for_way(List_throughput,List_flow,List_full_flow):- 
	calc_difference(List_throughput,List_flow,List_diff), 
	min_list_down(List_diff,Min), 
	increase_flow_by_diff(List_flow,Min,List_full_flow).

increase_flow_by_diff([],_,[]):-!.
increase_flow_by_diff([H1|T1],D,[H2|T2]):- H2 is H1+D, increase_flow_by_diff(T1,D,T2).

calc_difference([],[],[]):-!.
calc_difference([H1|T1],[H2|T2],[H3|T3]):- H3 is H1-H2, calc_difference(T1,T2,T3).

find_source(_,N,I,N,I):-!.
find_source(M,I_row,I_column,N,NumSource):- list_el_numb(M,Str,I_row), 
	list_el_numb(Str,0,I_column), I1 is I_row+1, 
	find_source(M,I1,I_column,N,NumSource),!.
find_source(M,_,I_column,N,NumSource):- I1 is I_column+1, 
	find_source(M,0,I1,N,NumSource).

find_drain([[]|_],I,I):-!.
find_drain([[0|T1]|T2],I,N):- find_drain([T1|T2],I,N),!.
find_drain([_|T],I,N):- I1 is I+1, find_drain(T,I1,N).

find_last_edge_from_source([H|_],I,I):- H\=0, !.
find_last_edge_from_source([_|T],I,N):- I1 is I+1, find_last_edge_from_source(T,I1,N).

write_list([]):-!.
write_list([Head|Tail]):- write(Head), write(" "), write_list(Tail).

% find_way(ListEdges,CurListWay,EndVertex,NotEnd,Drain,N,ListWays).
% N - номер последнего ребра из истока.
find_way(_,[],_,N,_,N,[]):-!.
find_way(ListEdges,L,D,_,D,N,[L|T]):- delete_last_elem(L,L1,BeginningEdge),
	find_way(ListEdges,L1,BeginningEdge,D,D,N,T),!.

find_way(ListEdges,CurListWay,EndVertex,NotEnd,D,N,ListWays):- 
	(find_edge(ListEdges,EndVertex,NotEnd,Edge) ->
	append(CurListWay,[[EndVertex,Edge]],Cur),
	find_way(ListEdges,Cur,Edge,-1,D,N,ListWays);
	delete_last_elem(CurListWay,Cur,BeginningEdge),
	find_way(ListEdges,Cur,BeginningEdge,EndVertex,D,N,ListWays)).

find_edge([[V1,V2]|_],V1,H,V2):- V2 > H, !.
find_edge([_|T],Begin,End,Edge):- find_edge(T,Begin,End,Edge).

delete_last_elem([[V1,_]],[],V1):-!.
delete_last_elem([H|T1],[H|T2],V):- delete_last_elem(T1,T2,V).

make_matrix_0(_,0,[]):-!.
make_matrix_0(L,N,[L|T]):- N1 is N-1, make_matrix_0(L,N1,T).

reverse_list([],List):- reverse_list([],[],List),!.
reverse_list([Head|Tail],List):- reverse_list([Head|Tail],[],List).
reverse_list([],List1,List1):-!.
reverse_list([Head|Tail],List_r, List):- reverse_list(Tail,[Head|List_r],List).

min(X,Y,X):-X<Y,!.
min(_,Y,Y).

min_list_down([Head|Tail],Min):- min_list_down(Tail,Head,Min).
min_list_down([],M,M):-!.
min_list_down([Head|Tail],M,Min):- min(Head,M,Min1), min_list_down(Tail,Min1,Min).

