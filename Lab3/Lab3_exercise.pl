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