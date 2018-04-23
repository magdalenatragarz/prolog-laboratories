delta(A,B,C,Delta):-
	Delta is B*B-4*A*C.

kwadrat(A,B,C,Pierwiastek):-
	delta(A,B,C,X),
	Buf is -1*B+sqrt(X),
	Buf2 is 2*A,
	Pierwiastek is Buf/Buf2.
