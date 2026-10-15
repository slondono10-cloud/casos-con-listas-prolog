familia([
    padre(abraham, herbert),
    padre(abraham, homero),
    padre(clancy, marge),
    padre(clancy, patty),
    padre(clancy, selma),
    padre(homero, bart),
    padre(homero, lisa),
    padre(homero, maggie),
    madre(mona, herbert),
    madre(mona, homero),
    madre(jacqueline, marge),
    madre(jacqueline, patty),
    madre(jacqueline, selma),
    madre(marge, bart),
    madre(marge, lisa),
    madre(marge, maggie),
    madre(selma, ling)
]).

padre(X, Y) :-
    familia(F),
    member(padre(X,Y), F).

madre(X, Y) :-
    familia(F),
    member(madre(X,Y), F).

progenitor(X, Y) :-
    padre(X, Y).

progenitor(X, Y) :-
    madre(X, Y).

hermanos(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \= Y.

abuelo(X, Z) :-
    progenitor(X, Y),
    progenitor(Y, Z).

tio(X, Z) :-
    hermanos(X, Y),
    progenitor(Y, Z).
