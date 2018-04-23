compare3and4([_,_,X,Y|_]):-
	X = Y.

switch3and4([A,B,X,Y|T],[A,B,Y,X|T]).

nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.

sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).

ostatni([X],X).
ostatni([_|T],OSTATNI):-
	ostatni(T,OSTATNI).

ostatni_sklej(X,OSTATNI):-
	sklej(_,[OSTATNI],X).
	
