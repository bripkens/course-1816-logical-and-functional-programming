% Task 3.1
is_list([]).
is_list([_|R]) :- is_list(R).



% Task 3.2
ue_member(X, [X]).
ue_member(X, [X|_]).
ue_member(X, [_|R]) :- ue_member(X, R).



% Task 3.3
flatten(List, Flattened) :- flatten(List, [], Flattened).

flatten([], Flattened, Flattened).

flatten([Head|Rest], L, Result) :-
  flatten(Rest, L, FlattenedTail),
  flatten(Head, FlattenedTail, Result).

flatten(Item, FlattenedTail, [Item|FlattenedTail]) :- \+(is_list(Item)).



% Task 3.4
ue_length([], 0).
ue_length([_|T], [X]) :- ue_length(T, X).



% Task 4
reverse_deep(List, Result) :- reverse_deep(List, [], Result).
reverse_deep([], Reversed, Reversed).

reverse_deep([Head|Rest], Temp, Result) :-
  \+(is_list(Head)),
  reverse_deep(Rest, [Head|Temp], Result). % the rest always appends itself to
                                           % the beginning, thus reversing the
                                           % list.

reverse_deep([Head|Rest], Temp, Result) :-
  is_list(Head),
  reverse_deep(Head, [], L), % all nested elements are wrapped in a new list
                             % wrapping happens through the next line
  reverse_deep(Rest, [L|Temp], Result).

% reverse_deep([1,2,3], X).
% reverse_deep([1,2, [3, 4], 5, 6], X).
% reverse_deep([1, 2, [3,4,5,[6,7], 8], [9, 10], 11, 12], X).



% Task 5
as_find([[Key|Value]|_], Key, Value).
as_find([_|Rest], Key, Value) :- as_find(Rest, Key, Value).
% get_val([Key|Value], Key, Value).

% as_find([[a, 1], [b, 7], [c, 4], [a, 6], [c, 5], [d, 4], [b, 2]], a, D).
% as_find([[a, 1], [b, 7], [c, 4], [a, 6], [c, 5], [d, 4], [b, 2]], b, D).
% D = 7?
% D = 2?