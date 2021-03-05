write_list([]):-!.
write_list([Head|Tail]):- write(Head), nl, write_list(Tail).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

% 1
sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write_list(Houses),
		write(WHO1),nl,write(WHO2).

% 2
pr5_2:- Friends=[_,_,_],
		
		in_list(Friends,[belokurov,_]),
		in_list(Friends,[ryzhov,_]),
		in_list(Friends,[chernov,_]),
		
		in_list(Friends,[_,blond]),
		in_list(Friends,[_,red]),
		in_list(Friends,[_,dark]),
		
		not(in_list(Friends,[belokurov,blond])),
		not(in_list(Friends,[ryzhov,red])),
		not(in_list(Friends,[chernov,dark])),
		not(in_list(Friends,[belokurov,dark])),
		
		write_list(Friends),!.

% 3
pr5_3:- Friends=[_,_,_],

		in_list(Friends,[anna,_,_]),
		in_list(Friends,[valya,_,_]),
		in_list(Friends,[natasha,_,green]),
		in_list(Friends,[_,white,_]),
		in_list(Friends,[_,green,_]),
		in_list(Friends,[_,blue,_]),
		in_list(Friends,[_,_,white]),
		in_list(Friends,[_,_,blue]),
		in_list(Friends,[anna,Color,Color]),
		not(in_list(Friends,[valya,_,white])),
		not(in_list(Friends,[valya,white,_])),
		not(in_list(Friends,[valya,white,white])),
		
		write_list(Friends),!.

% 4

pr5_4:- Friends=[_,_,_],
		
		in_list(Friends,[ivanov,_,_,_]),
		in_list(Friends,[semenov,_,_,X2]),
		in_list(Friends,[borisov,_,1,_]),
		in_list(Friends,[_,slesar,0,0]),
		in_list(Friends,[_,tokar,_,X3]),
		in_list(Friends,[_,svarshik,_,_]),
		in_list(Friends,[_,_,_,1]),
		in_list(Friends,[_,_,_,2]),
		not(in_list(Friends,[semenov,tokar,_,_])),
		X2>X3,
		in_list(Friends,[Who1,slesar,_,_]),
		in_list(Friends,[Who2,tokar,_,_]),
		in_list(Friends,[Who3,svarshik,_,_]),

		write(Who1), write(" is slesar"), nl,
		write(Who2), write(" is tokar"), nl,
		write(Who3), write(" is svarshik"), !.
    
