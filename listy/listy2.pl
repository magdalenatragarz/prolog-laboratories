%----------------------------%
sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).
	
odwroc([],[]).
odwroc([H|T],L) :-
	odwroc(T,R),
	sklej(R,[H],L).
	
sklej_roznicowo(L - End, End, L).


	
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
	
palindrom(L) :-
	odwroc(L,L1),
	L=L1.
	
%---rotacyjne przecuniecie w lewo---%
przesun([H|T],L) :-
	sklej(T,[H],L).
	
	
	
%----------------------------%

znaczy(0,zero).   
znaczy(1,jeden).
znaczy(2,dwa).    
znaczy(3,trzy).
znaczy(4,cztery). 
znaczy(5,piec).
znaczy(6,szesc).  
znaczy(7,siedem).
znaczy(8,osiem).  
znaczy(9,dziewiec).


przeloz([],[]) :-!.
przeloz([H|T],L2) :-
	znaczy(H,X),
	przeloz(T,Z),
	sklej([X],Z,U),
	L2 = U.
	
	
%----------------------------%

nalezy(L,Z):-
	sklej(_,[Z|_],L).
	
podzbior(_,[]).	
podzbior(L,[H|T]):-
	nalezy(L,H),
	podzbior(L,T).
	


