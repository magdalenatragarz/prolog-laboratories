
%--------1---------

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

%--------2---------

napoj(alkohol,18).
napoj(oranzada,0).
wiek(tomek,10).
wiek(szymon,30).
mozePic(X,Y) :- wiek(X,W),napoj(Y,W2),W>W2.

%--------3---------

poznaje_swiat:-
	consult('kb.pl'),
	ask.

ask:-
	write('Podaj nazwe kraju.'),
	nl,
	read(KRAJ),
	answer(KRAJ).
	
answer(KRAJ):-
	graniczy(SASIAD,KRAJ),
	write('Toż to sąsiad '),
	write(SASIAD),
	nl,
	ask.

answer(KRAJ):-
	\+ graniczy(_,KRAJ),
	write('Nie znam, powiedz mi.'),
	nl,
	read(NOWY_SASIAD),
	assert(graniczy(NOWY_SASIAD,KRAJ)),
	tell('kb.pl'),
	listing(graniczy),
	told.

%--------4---------


%--------5---------


get(1,[H|_],H).
get(K,[_|L],ITEM):-
	K>1,	
	K1 is K - 1,
	get(K1,L,ITEM).
	
%--------6---------

delta(A,B,C,Wynik) :- Wynik is B*B-4*A*C, write('obliczam delte'),nl.
pierwiastek(A,B,C) :- delta(A,B,C,W), W<0,!, write('Brak'),nl.
pierwiastek(A,B,C) :- delta(A,B,C,W), W=:=0,!, write('Jedno'),nl.
pierwiastek(A,B,C) :- delta(A,B,C,W), W>0,!, write('Dwa'),nl.

%--------7---------

:- op(90,xfx,ma).
ala ma kota.



