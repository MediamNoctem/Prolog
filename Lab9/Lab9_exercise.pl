in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

read_str(A,N):- get0(X), r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):- K1 is K+1, append(B,[X],B1), get0(X1), r_str(X1,A,B1,N,K1).

write_list([]):-!.
write_list([Head|Tail]):- write(Head), write_list(Tail).

write_str([]):-!.
write_str([H|Tail]):- put(H), write_str(Tail).

% 1_1
p1_1:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), build_all_razm_p, told.
build_all_razm_p:- read_str(A,_), read(K), b_a_rp(A,K,[]).
		
b_a_rp(_,0,Perm1):- write_str(Perm1), nl, !, fail.
b_a_rp(A,N,Perm):- in_list(A,El), N1 is N-1, b_a_rp(A,N1,[El|Perm]).

% 1_2
p1_2:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), build_all_perm, told.
build_all_perm:- read_str(A,_), b_a_p(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):- in_list_exlude(T,El,Tail).

b_a_p([],Perm1):- write_str(Perm1), nl, !, fail.
b_a_p(A,Perm):- in_list_exlude(A,El,A1), b_a_p(A1,[El|Perm]).

% 1_3
p1_3:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), build_all_razm, told.
build_all_razm:- read_str(A,_), read(K), b_a_r(A,K,[]).
		
b_a_r(_,0,Perm1):- write_str(Perm1), nl, !, fail.
b_a_r(A,N,Perm):- in_list_exlude(A,El,A1), N1 is N-1, b_a_r(A1,N1,[El|Perm]).

% 1_4
p1_4:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr_subset, told.
pr_subset:- read_str(A,_), sub_set(B,A), write_str(B), nl, fail.

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):- sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):- sub_set(Sub_set,Set).

% 1_5
p1_5:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr_sochet, told.
pr_sochet:- read_str(A,_), read(K), sochet(B,K,A), write_str(B), nl, fail.
sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):- K1 is K-1, sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):- sochet(Sub_set,K,Set).

% 1_6
p1_6:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr_sochet_p, told.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):- K1 is K-1, sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):- sochet_p(Sub_set,K,Set).
pr_sochet_p:- read_str(A,_), read(K), sochet_p(B,K,A), write_str(B), nl, fail.

% 2
p2:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr2, told.
pr2:- Positions = [0,1,2,3,4], Itog_slovo = [_,_,_,_,_], 
	sochet(A_positions,2,Positions), put_letter(Itog_slovo,A_positions,0,a),
	in_list([b,c,d,e,f],El1), put_free(Itog_slovo,El1),
	in_list([b,c,d,e,f],El2), put_free(Itog_slovo,El2),
	in_list([b,c,d,e,f],El3), put_free(Itog_slovo,El3),
	write_list(Itog_slovo), nl, fail.

% put_letter(Word,Letter_positions,Letter).
% Ставим букву Letter на все позиции Letter_positions в списке Word.
put_letter(_,[],_,_):-!.
put_letter([H|T1],[I|T2],I,H):- I1 is I+1, put_letter(T1,T2,I1,H),!.
put_letter([_|T],Letter_positions,I,L):- I1 is I+1, put_letter(T,Letter_positions,I1,L).

put_free([H|_],L):- var(H), H = L,!.
put_free([_|T],L):- put_free(T,L),!.

% 3
p3:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr3, told.
pr3:- Positions = [0,1,2,3,4], Itog_slovo = [_,_,_,_,_], 
	sochet(A_positions,2,Positions), put_letter(Itog_slovo,A_positions,0,a),
	in_list_exlude([b,c,d,e,f],El1,A1), put_free(Itog_slovo,El1),
	in_list_exlude(A1,El2,A2), put_free(Itog_slovo,El2),
	in_list(A2,El3), put_free(Itog_slovo,El3),
	write_list(Itog_slovo), nl, fail.

% 4
p4:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr4, told.
pr4:- Positions = [0,1,2,3,4], Itog_slovo = [_,_,_,_,_], 
	in_list_exlude([a,b,c,d,e,f],El1,A1),
	sochet(L_positions,2,Positions), put_letter(Itog_slovo,L_positions,0,El1),
	in_list_exlude(A1,El2,A2), put_free(Itog_slovo,El2),
	in_list_exlude(A2,El3,A3), put_free(Itog_slovo,El3),
	in_list(A3,El4), put_free(Itog_slovo,El4),
	write_list(Itog_slovo), nl, fail.

% 5
p5:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr5, told.
pr5:- Positions = [0,1,2,3,4,5], Itog_slovo = [_,_,_,_,_,_], 
	sochet([El1,El2],2,[a,b,c,d,e,f]), del_sub([a,b,c,d,e,f],[El1,El2],A1),
	sochet(L1_positions,2,Positions), put_letter(Itog_slovo,L1_positions,0,El1),
	del_sub(Positions,L1_positions,Pos),
	sochet(L2_positions,2,Pos), put_letter(Itog_slovo,L2_positions,0,El2),
	in_list_exlude(A1,El3,A2), put_free(Itog_slovo,El3),
	in_list(A2,El4), put_free(Itog_slovo,El4),
	write_list(Itog_slovo), nl, fail.

del_sub(T,[],T):-!.
del_sub([H|T1],[H|T2],List):- del_sub(T1,T2,List),!.
del_sub([H|T1],List,[H|T3]):- del_sub(T1,List,T3).

% 6
p6:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr6, told.
pr6:- Positions = [0,1,2,3,4,5,6], Itog_slovo = [_,_,_,_,_,_,_], 
	in_list_exlude([a,b,c,d,e,f],El1,A1),
	in_list_exlude(A1,El2,A2),
	sochet(L1_positions,2,Positions), put_letter(Itog_slovo,L1_positions,0,El1),
	del_sub(Positions,L1_positions,Pos),
	sochet(L2_positions,3,Pos), put_letter(Itog_slovo,L2_positions,0,El2),
	in_list_exlude(A2,El3,A3), put_free(Itog_slovo,El3),
	in_list(A3,El4), put_free(Itog_slovo,El4),
	write_list(Itog_slovo), nl, fail.

% 7
p7:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr7, told.
pr7:- Positions = [0,1,2,3,4,5,6,7,8], Itog_slovo = [_,_,_,_,_,_,_,_,_], 
	sochet([El1,El2],2,[a,b,c,d,e,f]), del_sub([a,b,c,d,e,f],[El1,El2],A1),
	in_list_exlude(A1,El3,A2),
	sochet(L1_positions,2,Positions), put_letter(Itog_slovo,L1_positions,0,El1),
	del_sub(Positions,L1_positions,Pos),
	sochet(L2_positions,2,Pos), put_letter(Itog_slovo,L2_positions,0,El2),
	del_sub(Pos,L2_positions,P),
	sochet(L3_positions,3,P), put_letter(Itog_slovo,L3_positions,0,El3),
	in_list_exlude(A2,El4,A3), put_free(Itog_slovo,El4),
	in_list(A3,El5), put_free(Itog_slovo,El5),
	write_list(Itog_slovo), nl, fail.
	
% 8
p8:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr8, told.
pr8:- Positions = [0,1,2,3], Itog_slovo = [_,_,_,_], P = [3,4], in_list_exlude(P,A,_),
	sochet(A_positions,A,Positions), put_letter(Itog_slovo,A_positions,0,a),
	(A = 3 -> in_list([b,c,d,e,f],El), put_free(Itog_slovo,El); true),
	write_list(Itog_slovo), nl, fail.

% 9
p9:- tell('c:/Users/Anastasia/Desktop/p1_out.txt'), pr9, told.
pr9:- Positions = [0,1,2,3,4,5,6], Itog_slovo = [_,_,_,_,_,_,_], P = [3,4,5,6,7], 
	in_list_exlude(P,A,_),
	sochet(A_positions,A,Positions), put_letter(Itog_slovo,A_positions,0,a),
	(A = 3 -> in_list([b,c,d,e,f],El1), put_free(Itog_slovo,El1),
		in_list([b,c,d,e,f],El2), put_free(Itog_slovo,El2),
		in_list([b,c,d,e,f],El3), put_free(Itog_slovo,El3),
		in_list([b,c,d,e,f],El4), put_free(Itog_slovo,El4);
	(A = 4 -> in_list([b,c,d,e,f],El1), put_free(Itog_slovo,El1),
		in_list([b,c,d,e,f],El2), put_free(Itog_slovo,El2),
		in_list([b,c,d,e,f],El3), put_free(Itog_slovo,El3);
	(A = 5 -> in_list([b,c,d,e,f],El1), put_free(Itog_slovo,El1),
		in_list([b,c,d,e,f],El2), put_free(Itog_slovo,El2);
	(A = 6 -> in_list([b,c,d,e,f],El), put_free(Itog_slovo,El); true)))), 
	write_list(Itog_slovo), nl, fail.
