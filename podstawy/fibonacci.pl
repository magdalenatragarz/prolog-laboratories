fibonacci(0,0):-!.
fibonacci(1,1):-!.

fibonacci(RANGE,X) :-
	RANGE > 0,
	RANGE1 is RANGE-1,
	RANGE2 is RANGE-2,
	fibonacci(RANGE1,Z),
	fibonacci(RANGE2,Y),
	X is Z + Y.
