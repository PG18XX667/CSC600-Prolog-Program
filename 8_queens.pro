nocheck(_, []).
nocheck(X/Y, [X1/Y1 | Rest]):-
	X =\= X1,
	Y =\= Y1,
	abs(Y1-Y) =\= abs(X1-X),
	nocheck(X/Y, Rest).

legal([]).
legal([X/Y | Rest]):-
	legal(Rest),
	member(X, [1,2,3,4,5,6,7,8]),
	member(Y, [1,2,3,4,5,6,7,8]),
	nocheck(X/Y, Rest).

