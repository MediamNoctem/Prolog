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

% 5
pr5_5:- Containers=[_,_,_,_],
		
		in_list(Containers,[bottle,_]),
		in_list(Containers,[cup,_]),
		in_list(Containers,[pitcher,_]),
		in_list(Containers,[jar,_]),
		
		in_list(Containers,[_,milk]),
		in_list(Containers,[_,lemonade]),
		in_list(Containers,[_,kvass]),
		in_list(Containers,[_,water]),
		
		not(in_list(Containers,[bottle,milk])),
		not(in_list(Containers,[bottle,water])),
		not(in_list(Containers,[pitcher,lemonade])),
		not(in_list(Containers,[pitcher,kvass])),
		not(in_list(Containers,[jar,lemonade])),
		not(in_list(Containers,[jar,water])),
		not(in_list(Containers,[cup,milk])),
		
		write_list(Containers),!.

% 6
pr5_6:- Man=[_,_,_,_],

		in_list(Man,[voronov,_]),
		in_list(Man,[pavlov,_]),
		in_list(Man,[levitsky,_]),
		in_list(Man,[sakharov,_]),
		in_list(Man,[_,dancer]),
		in_list(Man,[_,artist]),
		in_list(Man,[_,singer]),
		in_list(Man,[_,writer]),
		
		not(in_list(Man,[voronov,singer])),
		not(in_list(Man,[levitsky,singer])),
		not(in_list(Man,[pavlov,artist])),
		not(in_list(Man,[pavlov,writer])),
		not(in_list(Man,[voronov,writer])),
		not(in_list(Man,[sakharov,writer])),
		not(in_list(Man,[voronov,artist])),
		write_list(Man),!.

% 7
pr5_7:- Sport=[_,_,_],
		
		in_list(Sport,[michael,_,basketball,X1]),
		in_list(Sport,[_,american,_,X2]),
		in_list(Sport,[_,_,_,0]),
		in_list(Sport,[_,_,_,1]),
		in_list(Sport,[_,_,cricket,2]),
		in_list(Sport,[simon,israeli,_,X3]),
		in_list(Sport,[richard,_,Who2,_]),
		in_list(Sport,[Who1,australian,_,_]),
		in_list(Sport,[_,_,tennis,X4]),
		X1>X2,
		X3>X4,
		
		write(Who1), write(" is australian"), nl,
		write("richard loves "), write(Who2),!.

% 8
check(El,[El|[H|T]],H):-!.
check(El,[_|List],N):- check(El,List,N),!.

%[звякли,турбобур,рубин,2,80],[брыкли,заступ,агат,0,131],[фигли,кирка,сапфир,4,159],[квакли,кайло,изумруд,3,176],[дрыхли,отбойный_молоток,алмаз,1,202]

pr5_8:- Gnomes=[[_,_,_,_,80],[_,_,_,_,131],[_,_,_,_,159],[_,_,_,_,176],[_,_,_,_,202]],
			
		in_list(Gnomes,[_,_,рубин,_,_]),
		in_list(Gnomes,[_,_,сапфир,_,X1]),
		check(X1,[80,131,159,176,202],X2),
		in_list(Gnomes,[_,кайло,_,_,X2]),

		
		in_list(Gnomes,[_,_,_,X3,131]),
		in_list(Gnomes,[_,_,алмаз,X4,_]),

		in_list(Gnomes,[_,заступ,_,_,_]),
		in_list(Gnomes,[_,турбобур,_,_,X5]),
		check(X5,[80,131,159,176,202],X6),
		in_list(Gnomes,[брыкли,_,_,0,X6]),
		%check(X6,[80,131,159,176,202],X7),

		in_list(Gnomes,[_,_,изумруд,_,X7]),
		in_list(Gnomes,[фигли,_,_,4,X8]),
		X7>X8, X8>80,
		not(in_list(Gnomes,[звякли,_,сапфир,_,_])),
		in_list(Gnomes,[звякли,_,_,2,X9]),
		check(X9,[80,131,159,176,202],X10),
		in_list(Gnomes,[_,_,агат,_,X10]),

		in_list(Gnomes,[_,кирка,_,_,X11]),
		check(X11,[80,131,159,176,202],X12),
		in_list(Gnomes,[квакли,_,_,3,X12]),
		check(X12,[80,131,159,176,202],X13),
		in_list(Gnomes,[_,отбойный_молоток,алмаз,_,X13]),
		in_list(Gnomes,[дрыхли,_,_,1,_]),
		X4 is X3+1,

		write_list(Gnomes).
