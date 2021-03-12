write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

% 1
p1:- read_str(List,Length), write_str(List), write(", "), write_str(List), 
	write(", "), write_str(List), nl, write("Length = "), write(Length).
	
% 2
p2:- write("Enter a string without spaces at the beginning and end."), nl,
	read_str(List,_), count_words(List,0,K), 
	(K\=0 -> Num is K+1, write("Number = "), write(Num); write("Empty!")),!.
	
count_words([],K,K):-!.
count_words([H|T],I,K):- H = 32, I1 is I+1, count_words(T,I1,K).
count_words([_|T],I,K):- count_words(T,I,K).