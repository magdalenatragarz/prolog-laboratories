ksiazka(16,'Flatlandia',autor('Edwin Abbott Abbott',1838-1926),wydanie('Seel & Co',1884)).
ksiazka(17,'Flatlandia',autor('Edwin Abbott Abbott',1838-1926),wydanie('Seel & Co',1884)).
ksiazka(34,'Kobieta z wydm',autor('Kobo Abe',1924-1993),wydanie('Wydawnictwo Znak',2007)).
ksiazka(87,'Gargantua i Pantagruel',autor('Francois Rabelians',1494-1553),wydanie('Siedmioróg',2004)).


xxi_century(Book) :-
	ksiazka(_,Book,_,wydanie(_,Year)),
	Year >= 2000,
	Year<2100.

przelom(NAME):-
	ksiazka(_,_,autor(NAME,P-K),_),
	Poczatek is P // 100,
	Koniec is K // 100,
	Poczatek \= Koniec.



tytul(X) :-
	ksiazka(_,X,_,_).	

bezdup(X):-
	setof(Y,tytul(Y),X). % = bagof tylko że to sortuje, zwraca bez duplikatów
