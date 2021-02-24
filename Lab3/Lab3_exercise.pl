max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max(X,Y,U,X):-X>Y,X>U,!.
max(_,Y,U,Y):-Y>U,!.
max(_,_,U,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

fact(N,X,N,X):-!.
fact(I,F,N,X):-I1 is I+1,F1 is F*I1,fact(I1,F1,N,X).
fact_down(N,X):-fact(0,1,N,X).

fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,fib(N1,X1),N2 is N-2,fib(N2,X2),X is X1+X2.

fib(N,_,X,N,X):-!.
fib(I,F1,F2,N,X):-I1 is I+1, F3 is F1+F2,fib(I1,F2,F3,N,X).
fib_down(N,X):-N>0,fib(1,0,1,N,X).

sum_digits_up(0,0):-!.
sum_digits_up(N,S):-N1 is N div 10, sum_digits_up(N1,S1), S is S1 + N mod 10.

sum_digits_down(N,S):-sum_digits_down(N,0,S).
sum_digits_down(0,S,S):-!.
sum_digits_down(N,Sum,S):-N1 is N mod 10, N2 is N div 10, Sum1 is N1+Sum, sum_digits_down(N2,Sum1,S).

min(X,Y,X):-X<Y,!.
min(_,Y,Y).
min_digit_up(N,Min):- N1 is N div 10, N1 = 0, Min is N mod 10,!.
min_digit_up(N,Min):- N1 is abs(N) div 10, min_digit_up(N1,Min2),Min1 is abs(N) mod 10, min(Min1,Min2,Min).

min_digit_down(N1,Min):- N is abs(N1),M is N mod 10,min_digit_down(N,M,Min).
min_digit_down(0,M,M):-!.
min_digit_down(N,M,Min):- M1 is N mod 10, N1 is N div 10, min(M1,M,Min1),min_digit_down(N1,Min1,Min).

number_digit_up(0,0):-!.
number_digit_up(N,Count):- N1 is abs(N) div 10, number_digit_up(N1,Count1), N2 is abs(N) mod 10, (N2<3 -> Count is Count1+1;Count is Count1).

number_digit_down(N1,Count):- N is abs(N1),number_digit_down(N,0,Count).
number_digit_down(0,C,C):-!.
number_digit_down(N,C,Count):- N1 is N mod 10, (N1<3 -> C1 is C+1;C1 is C), N2 is N div 10, number_digit_down(N2,C1,Count).

nod(X,X,X):-!.
nod(X,Y,Z):- (X < Y -> D is Y-X, nod(X,D,Z); D is X-Y, nod(D,Y,Z)).

prime(X1):- X is abs(X1), prime(1,X).
prime(X,X):-!.
prime(I,X):- X1 is X mod I, (X1\=0 -> I1 is I+1, prime(I1,X);fail).

number_div(X1,Count):- X is abs(X1), number_div(0,1,X,Count).
number_div(I,X,X,I1):- I1 is I + 1,!.
number_div(I,D,X,Count):- X1 is X mod D, D1 is D+1, (X1=0 -> I1 is I+1;I1 is I), number_div(I1,D1,X,Count).

collatz(N,Count):- N>0, collatz(N,0,Count).
collatz(1,C1,C):- C is C1 + 1,!.
collatz(N,C,Count):- C1 is C + 1, N1 is N mod 2, (N1=0 -> N2 is N div 2; N2 is 3*N+1),collatz(N2,C1,Count).

collatz_max(Numb):- collatz_max(0,0,0,Numb).
collatz_max(1000000,Num,_,Num):-!.
collatz_max(N,Num,M,Numb):- N1 is N + 1, collatz(N1,M1), (M1>M -> N2 is N1, M2 is M1; N2 is Num, M2 is M), collatz_max(N1,N2,M2,Numb).
