% bratko, 9.1

gt(X,Y) :- X>Y.
gt(X,Y) :- X@>Y.

bubblesort(List, Sorted) :-
	swap(List, List1), !,
	bubblesort(List1, Sorted).
	% A useful swap in List ?

bubblesort(Sorted, Sorted).
	% Otherwise list is already sorted

swap([X,Y|Rest], [Y,X|Rest]) :- gt(X, Y).
	% swap first two elements

swap([Z|Rest], [Z|Rest1]) :- swap(Rest, Rest1).
	% swap elements in tail



%--------%


insertsort([], []).
insertsort([Head|Tail], L2):-
        insertsort(Tail, L1),
        insert(Head, L1, L2).

insert(Element, [Head|Tail], [Head|Rest]):-
        gt(Element,Head),!,
        insert(Element, Tail, Rest).
insert(Element, List, [Element|List]).

%--------%


% mergesort(+List1,-List2)
%  Sorts List1 giving List2 using mergesort.

mergesort([First,Second|Rest],Result) :-   % list has at least 2 elements
  !,
  partition([First,Second|Rest],L1,L2),
  mergesort(L1,SL1),
  mergesort(L2,SL2),
  mergelist(SL1,SL2,Result).

mergesort(List,List).                      % list has 0 or 1 element



% mergelist(+List1,+List2,-Result)
%  Combines two sorted lists into a sorted list.

mergelist([First1|Rest1],[First2|Rest2],[First1|Rest]) :-
  First1 @< First2,
  !,
  mergelist(Rest1,[First2|Rest2],Rest).

mergelist([First1|Rest1],[First2|Rest2],[First2|Rest]) :-
  \+ First1 @< First2,
  !,
  mergelist([First1|Rest1],Rest2,Rest).

mergelist(X,[],X).

mergelist([],X,X).



% partition(+List,-List1,-List2)
%  splits List in two the simplest way,
%  by putting alternate members in different lists

partition([First,Second|Rest],[First|F],[Second|S]) :-  % 2 or more elements
   !,
   partition(Rest,F,S).

partition(List,List,[]).                                % 0 or 1 element



% Demonstration predicate

testsort :- mergesort([7,0,6,5,4,9,4,6,3,3],What), write(What).

%--------%



conc([],L,L).
conc([X|L1],L2,[X|L3]) :-
	conc(L1,L2,L3).

quicksort( [], []).

quicksort( [X|Tail], Sorted)  :-
   split( X, Tail, Small, Big),
   quicksort( Small, SortedSmall),
   quicksort( Big, SortedBig),
   conc( SortedSmall, [X|SortedBig], Sorted).

split( _, [], [], []).

split( X, [Y|Tail], [Y|Small], Big)  :-
   gt( X, Y), !,
   split( X, Tail, Small, Big).

split( X, [Y|Tail], Small, [Y|Big])  :-
   split( X, Tail, Small, Big).



