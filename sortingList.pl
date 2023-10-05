merges([],[]).
merges([X],[X]).
merges(L,LO):-
  divide2(L,L1,L2),
  merges(L1,L1O),
  merges(L2,L2O),
  merge(L1O,L2O,LO), !.

divide2(L,L1,L2):-
  length(L,N),
  M is N//2,
  append(L1,L2,L),
  length(L1,M).

merge([],L,L).
merge(L,[],L).
merge([X1|L1],[X2|L2],[X1|L]):- X1<X2, !, merge(L1,[X2|L2],L).
merge([X1|L1],[X2|L2],[X2|L]):- merge([X1|L1],L2,L).

% Con eso, cuando lo compilan, ya pueden ejecutarlo así:
% | ?- merges([2,8,34,5,6,90,23,4,12,56,78, 45,67,99,123,34,23,67,44,79],LO).
% LO = [2,4,5,6,8,12,23,23,34,34,44,45,56,67,67,78, 79,90,99,123]


qs([],[]).
qs([P|L],LO):-
  divide(L,P,L1,L2),
  qs(L1,L1O),
  qs(L2,L2O),
  append(L1O,[P|L2O],LO).
divide([],_,[],[]).
divide([X|L],P,[X|L1],L2):- X<P, !, divide(L,P,L1,L2).
divide([X|L],P,L1,[X|L2]):- divide(L,P,L1,L2).

% Con eso, cuando lo compilan, ya pueden ejecutarlo así:

% | ?- qs([2,8,34,5,6,90,23,4,12,56,78,45,67,99,123,34,23,67,44,79],LO).
% LO = [2,4,5,6,8,12,23,23,34,34,44,45,56,67,67,78,79,90,99,123]