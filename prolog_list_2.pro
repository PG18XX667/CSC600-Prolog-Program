m([tom, joe, peter, john, alex, dael, shawn, dick, steve, ben, kai]).
f([ann, cathy, jane, kim, kitty, alice, lucy, mia, chloe, haley]).

family([john, ann, [tom,kim]]).
family([joe, jane, [dael, alice]]). %fourth gen

family([alex, kitty, [ann, joe]]).
family([alex, lucy, [shawn, dick]]). %third gen

family([steve ,mia, [alex, cathy]]). %second gen

family([ben, haley, [chloe, mia]]). %first gen


male(X):-
	m(L),
    member(X, L).
	
female(X):-
	f(L),
    member(X, L).
	
father(X):-
	m(L),
	member(X, L),
	family(S),
	member(X, S).
		
mother(X):-
	f(L),
	member(X, L),
	family(S),
	member(X, S).
	
parent(X):-
	family([F, M | [_]]),
	(X = F; X = M).

parent(X, Y):-
	family([F, M | [L]]),
	(X = F; X = M),
	member(Y, L).
	
	
siblings(X, Y):-
	family([_ , _ | [L]]),
	member(X, L),
	member(Y, L),
	X \= Y.
	
brother(X, Y) :-
  siblings(X, Y),
  male(X).

brothers(X, Y):-
	male(X),
	male(Y),
	family([_ , _ | [L]]),
	member(X, L),
	member(Y, L),
	X \= Y.
	
sister(X, Y) :-
  siblings(X, Y),
  female(X).

sisters(X, Y):-
	female(X),
	female(Y),
	family([_ , _ | [L]]),
	member(X, L),
	member(Y, L),
	X \= Y.

cousins(X, Y):-
	family([F , _ | [_]]),
	parent(F, X),
	siblings(F, S),
	parent(S, Y).
	
cousins(X, Y):-
	family([_ , M | [_]]),
	parent(M, X),
	siblings(M, S),
	parent(S, Y).
	
uncle(X, Y):-
	family([F , _ | [_]]),
	brother(X, F),
	parent(F, Y).

uncle(X, Y):-
	family([_ , M | [_]]),
	brother(X, M),
	parent(M, Y).	

aunt(X, Y):-
	family([F , _ | [_]]),
	sister(X, F),
	parent(F, Y).

aunt(X, Y):-
	family([_ , M | [_]]),
	sister(X, M),
	parent(M, Y).

grandchild(X, Y):-
	parent(Y, F),
	parent(F, X).

grandson(X, Y):-
	parent(Y, F),
	parent(F, X),
	male(X).

granddaughter(X, Y):-
	parent(Y, F),
	parent(F, X),
	female(X).

greatgrandparent(X, Y):-
	grandchild(Y, A),
	parent(X, A).

ancestor(X, Y):-
	greatgrandparent(A, Y),
	parent(X, A).