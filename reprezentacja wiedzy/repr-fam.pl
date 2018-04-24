
% dane

rodzina(
	osoba(jan, kowalski,data(5,kwiecien,1946),pracuje(tpsa,3000)),
	osoba(anna,kowalski,data(8,luty,1949),    pracuje(szkola,1500)), 
	[
	 osoba(maria,kowalski,data(20,maj,1973),     pracuje(argo_turist,4000)),
	 osoba(pawel,kowalski,data(15,listopad,1979),zasilek)]).
       
rodzina(
	osoba(krzysztof, malinowski, data(24,lipiec,1950), bezrobocie),
	osoba(klara, malinowski, data(9,styczen,1951), pracuje(kghm,8000)),
	[
	 osoba(monika, malinowski, data(19,wrzesien,1980), bezrobocie)]
	).

% zaleznosci

maz(X) :-
	rodzina(X,_,_).

zona(X) :-
	rodzina(_,X,_).

dziecko(X) :-
	rodzina(_,_,Dzieci),
	nalezy(X,Dzieci).

istnieje(Osoba) :-
	maz(Osoba)
	;
	zona(Osoba)
	;
	dziecko(Osoba).

data_urodzenia(osoba(_,_,Data,_),Data).

pensja(osoba(_,_,_,pracuje(_,P)),P).
pensja(osoba(_,_,_,zasilek),500).
pensja(osoba(_,_,_,bezrobocie),0).

zarobki([],0).
zarobki([Osoba|Lista],Suma) :-
	pensja(Osoba,S),
	zarobki(Lista,Reszta),
	Suma is S + Reszta.

% narzedzia
nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).


%wypisywanie wszystkich osób
wypisz-osoby :-
	rodzina(osoba(X,Y,_,_),osoba(Z,T,_,_),_),
	wypisz_dzieci,
	write(X),
	write(' '),
	write(Y),
	nl,
	write(Z),
	write(' '),
	write(T),
	fail.

show_records(LISTA) :-
	nalezy(osoba(X,Y,_,_),LISTA),
	write(X),
	write(' '),
	write(Y),
	nl.
  
%wypisywanie dzieci

wypisz_dzieci:-
	dziecko(osoba(X,Y,_,_)),
	write(X),
	write(' '),
	write(Y),
	nl,
	fail.

  
show_records_salaries([]).
show_records_salaries([A|B]) :-
    pensja(A,X),
    write(X),nl,
    show_records_salaries(B).
  
  

%pokaż pensje wszystkich   
show_salaries:-
    rodzina(X,Y,Z),
    pensja(X,A),
    write(A),nl,
    pensja(Y,B),
    write(B),nl,
    show_records_salaries(Z),fail.
    
%pokaż daty urodzenia
born(YEAR) :-
	rodzina(_,_,KIDS),
	show_records_birdthdates(KIDS,YEAR).

show_records_birdthdates([],_).
show_records_birdthdates([osoba(N,S,data(_,_,YEAR),_)|B],YEAR) :-
	write(N),
	write(' '),
	write(S),
  	show_records_birdthdates(B,YEAR).
   
data(YEAR):-
	istnieje(X),
	dziecko(X),
	data_urodzenia(X,YEAR).
 
%born(A):-
%    istnieje(X(Imie,Nazwisko,_,_)),data_urodzenia(X,Data),Data==A,write%%(Imie),write(' '),write(Nazwisko).
    

