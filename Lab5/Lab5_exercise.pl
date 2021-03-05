write_list([]):-!.
write_list([Head|Tail]):- write(Head), nl, write_list(Tail).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).
  
% 2
man(belokurov).
man(ryzhov).
man(chernov).

friend(last_name,hair_color).

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










    
