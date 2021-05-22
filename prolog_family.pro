% Facts 
is_male(qw). %Me
is_male(qj). %My brother
is_male(rn). %My cousin
is_male(qg). %My aunt's husband
is_male(ky). %My cousin
is_male(cf). %My grandfather
is_male(cff). %My  greatgrandfather
is_male(cfff). %My greatgreatgrandfather

is_female(cffw). %My  greatgrandfather's wife
is_female(sf). %My cousin
is_female(gz). %My aunt
is_female(mf). %My mom
is_female(at). %My grandfather's wife

is_parent_of(cfff, cff).
is_parent_of(cff, cf).
is_parent_of(cffw, cf).
is_parent_of(cf, rn).
is_parent_of(cf, gz).
is_parent_of(at, rn).
is_parent_of(at, gz).
is_parent_of(at, rn).
is_parent_of(at, gz).
is_parent_of(gz, ky).
is_parent_of(gz, sf).
is_parent_of(mf, qw).
is_parent_of(mf, qj).
is_parent_of(rn, qw).
is_parent_of(rn, qj).
is_parent_of(qg, sf).
is_parent_of(qg, ky).

% Rules
mother(X, Y):-
	is_parent_of(X, Y), is_female(X).
	
father(X, Y):-
	is_parent_of(X, Y), is_male(X).
	
sibling1(X, Y):-
	is_parent_of(A, X), is_parent_of(A, Y), X \= Y.

brother1(X, Y):-
	is_parent_of(A, X), is_parent_of(A, Y), is_male(X), X \= Y.
	
sister1(X, Y):-
	is_parent_of(A, X), is_parent_of(A, Y), is_female(X), X \= Y.

sibling2(X, Y):-
	is_parent_of(A, X), is_parent_of(B, X), is_parent_of(A, Y), is_parent_of(B, Y), X \= Y.
	
brother2(X, Y):-
	is_parent_of(A, X), is_parent_of(B, X), is_parent_of(A, Y), is_parent_of(B, Y), is_male(X), X \= Y.
	
sister2(X, Y):-
	is_parent_of(A, X), is_parent_of(B, X), is_parent_of(A, Y), is_parent_of(B, Y), is_female(X), X \= Y.

cousin(X, Y):-
	is_parent_of(A, X), is_parent_of(B, Y), sibling2(A, B).
	
uncle(X, Y):-
	is_male(X), is_parent_of(A, Y), sibling2(A, X).

aunt(X, Y):-
	is_female(X), is_parent_of(A, Y), sibling2(A, X).

grandparent(X, Y):-
	is_parent_of(X, A), is_parent_of(A, Y).
	
grandmother(X, Y):-
	is_parent_of(X, A), is_parent_of(A, Y), is_female(X).
	
grandfather(X, Y):-
	is_parent_of(X, A), is_parent_of(A, Y), is_male(X).

grandchild(X, Y):-
	is_parent_of(Y, A), is_parent_of(A, X).	

greatgrandparent(X, Y):-
	is_parent_of(X, A), is_parent_of(A, B), is_parent_of(B, Y).
	
ancestor(X, Y):-
	is_parent_of(X, A), is_parent_of(A, B), is_parent_of(B, C), is_parent_of(C, Y).
		