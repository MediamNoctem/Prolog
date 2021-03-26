in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

read_str(A,N):- get0(X), r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):- K1 is K+1, append(B,[X],B1), get0(X1), r_str(X1,A,B1,N,K1).

read_str(A,N,Flag):- get0(X), r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):- K1 is K+1, append(B,[X],B1), get0(X1), r_str(X1,A,B1,N,K1,Flag).

write_str([]):-!.
write_str([H|Tail]):- put(H), write_str(Tail).

% 1_1
p1_1:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), build_all_razm_p, told.
build_all_razm_p:- read_str(A,_,_), read(K), b_a_rp(A,K,[]).
		
b_a_rp(_,0,Perm1):- write_str(Perm1), nl, !, fail.
b_a_rp(A,N,Perm):- in_list(A,El), N1 is N-1, b_a_rp(A,N1,[El|Perm]).

% 1_2
p1_2:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), build_all_perm, told.
build_all_perm:- read_str(A,_,_), b_a_p(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):- in_list_exlude(T,El,Tail).

b_a_p([],Perm1):- write_str(Perm1), nl, !, fail.
b_a_p(A,Perm):- in_list_exlude(A,El,A1), b_a_p(A1,[El|Perm]).

% 1_3
p1_3:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), build_all_razm, told.
build_all_razm:- read_str(A,_,_), read(K), b_a_r(A,K,[]).
		
b_a_r(_,0,Perm1):- write_str(Perm1), nl, !, fail.
b_a_r(A,N,Perm):- in_list_exlude(A,El,A1), N1 is N-1, b_a_r(A1,N1,[El|Perm]).
