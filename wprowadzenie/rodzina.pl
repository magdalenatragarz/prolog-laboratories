rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).
rodzic(robert,anna).
rodzic(robert,magda).
rodzic(magda,jan).
rodzic(eliza,bogna).
 
kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).
 
mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

%-----------%

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).
 
ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).

brat(X,Y) :-
	rodzic(A,X),
	rodzic(A,Y),	
	mezczyzna(Y).

siostra(X,Y) :-
	rodzic(A,X),
	rodzic(A,Y),
	kobieta(Y).

dziadek(X,Y) :-
	rodzic(A,Y),
	rodzic(X,A),
	mezczyzna(X).

babcia(X,Y) :- 
	rodzic(A,Y),
	rodzic(X,A),
	kobieta(X).

przodek(X,Y) :-
	rodzic(X,Y).
 
przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

potomek(X,Y) :-
	przodek(Y,X).

krewny(X,Y) :-
	potomek(X,Y);
	przodek(X,Y);
	rodzic(A,X),brat(A,B),rodzic(B,Y);
	rodzic(A,X),siostra(A,B),rodzic(B,Y).

	
