-module(w2_9_list).
-export([double/1, evens/1, median/1, mode/1]).

double([]) -> [];
double([H|T]) ->
    [H * 2 | double(T)].

evens([]) -> [];
evens([H|T]) ->
    case H rem 2 of
        0 ->
            [H | evens(T)];
        _ ->
            evens(T)
    end.

median([]) -> [];
median(L) ->
    Sorted = bubble_sort(L),
    M = length(Sorted) div 2,

    case length(Sorted) rem 2 of
        0 ->
            (lists:nth(M, Sorted) + lists:nth(M + 1, Sorted)) / 2;
        _ ->
            lists:nth(M + 1, Sorted)
    end.

mode([]) -> [];
mode(L) ->
    S = bubble_sort(L),
    mode(S, {hd(S),1}, []).

mode([_H|[]], {Mode,Count}, ACC) ->
    [{Mode,Count} | ACC];
mode([H|T], {Mode,Count}, ACC) ->
    case hd(T) of
        H ->
            mode(T, {Mode,Count+1}, ACC);
        _ ->
            mode(T, {hd(T), 1}, [{Mode,Count} | ACC])
    end.


% For saving human time complexity,
% we go for the bubble sort for now!
%
% We intend not to use any lists:function for the sake of learning.
% And this is a mix of direct and tail recursions.

% Direct recursion
bubble([]) -> [];
bubble([H1,H2|T]) when H1 > H2 ->
    [H2 | bubble([H1|T])];
bubble([H|T]) ->
    [H | bubble(T)].

% Tail recursion without optimization on bubble_sort.
bubble_sort(L) ->
    bubble_sort(L, L).
bubble_sort([], S) ->
    S;
bubble_sort([_H|T], ACC) ->
    bubble_sort(T, bubble(ACC)).
