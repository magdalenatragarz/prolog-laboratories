%----------------------------%
sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).
	
%----------------------------%
delete3last(L,L1) :-
	sklej(L1,[_,_,_],L).
	
delete3first(L,L1) :-
	sklej([_,_,_],L1,L).
	
delete3first3last(L,L2) :-
	sklej([_,_,_],L1,L),
	sklej(L2,[_,_,_],L1).
	
	
parzysta([_,_]).	
parzysta([_,_|T]) :-
	parzysta(T).
	
nieparzysta(L) :-
	not(parzysta(L)).
	