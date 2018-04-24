poznaje_swiat:-
	consult('kb.pl'), nl,
	process_a_country.

process_a_country :- 
	write('Type country name.'), nl,
        read(COUNTRY),
        answer(COUNTRY).

answer(stop) :-    
	write('Saving the knowledge base...'),nl,
        tell('kb.pl'),
        listing(graniczy),
        told,
        write('Done.'),nl.

answer(COUNTRY) :-
	graniczy(GRANICZY,COUNTRY),
	write('Toż to sąsiad '),
	write(GRANICZY),
	nl,
	process_a_country.

answer(COUNTRY) :-
	 \+ graniczy(_,COUNTRY),
	write('I do not know the neighbours of that country'),
	nl,
	write('Please, tell me'),
	nl,
	read(NEIGHBOUR),
	assert(graniczy(NEIGHBOUR,COUNTRY)),
	process_a_country.


