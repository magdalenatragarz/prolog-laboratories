kolor(czerwony).
kolor(zielony).
kolor(niebieski).


koloruj(Pl,B,U,S,Cz):-
	kolor(Pl),kolor(B),Pl\=B,B\=Pl,
	kolor(Pl),kolor(U),Pl\=U,U\=Pl,
	kolor(Pl),kolor(S),Pl\=S,S\=Pl,
	kolor(Pl),kolor(Cz),Pl\=Cz,Cz\=Pl,
	kolor(B),kolor(U),B\=U,U\=B,
	kolor(S),kolor(U),S\=U,U\=S,
	kolor(S),kolor(Cz),S\=Cz,Cz\=S,
	write('Polska='),write(Pl),nl,
	write('Bialorus='),write(B),nl,
	write('Slowacja='),write(S),nl,
	write('Czechy='),write(Cz),nl,
	write('Ukraina='),write(U),nl,
	nl,fail.
	
