member1(X, [X|_]).
member1(X, [_|T]):-
	member1(X, T).
	
firstelement(X, [X|_]).
	
lastelement([X], X).
lastelement([_|T], X):-
	lastelement(T, X).
	
twoadjacent(X, Y, [X, Y|_]).
twoadjacent(X, Y, [_|T]):-
	twoadjacent(X, Y, T).
	
threeadjacent(X, Y, Z, [X, Y, Z|_]).
threeadjacent(X, Y, Z, [_|T]):-
	threeadjacent(X, Y, Z, T).
	
append1([], L2, L2).
append1([X|T1], L2, [X|T3]):-
	append1(T1, L2, T3).
	
delete1(X, [X|T], T).
delete1(X, [H|T], [H|T1]):-
	delete1(X, T, T1).
	
insert1(X, L , XL):-
	delete1(X, XL, L).
	
length1([], 0).
length1([_|T], N):-
	length1(T, K),
	N is 1+K.

ispalindrome([], []).
ispalindrome([H|T], P) :-
  delete1(H,P,P1), ispalindrome(T, P1).
	
reverse1([], []).
reverse1([H|T], Rev):-
	reverse1(T, RT),
	append(RT, [H], Rev).

displaylist( [ ] ):- nl.
displaylist([H|T]):- 
	write(H), 
	tab(1),
	displaylist(T).