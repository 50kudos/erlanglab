-module(w2_6_list).
-export([t_product/1, product/1, t_maximum/1, maximum/1]).

% t_ prefix means tail recursion implementation.

t_product(L) ->
    t_product(L, 1).
t_product([], P) ->
    P;
t_product([H|T], A) when is_number(H) ->
    t_product(T, H * A).

product([]) ->
    1;
product([H|T]) when is_number(H) ->
    H  * product(T).

% No magic maximum value like an infinity
% Maximum of empty list is an empty list
%
t_maximum([]) ->
    [];
t_maximum(L) ->
    t_maximum(L, hd(L)).
t_maximum([], M) ->
    M;
t_maximum([_H|T], A) ->
    case T of
        [] -> A;
        _ -> t_maximum(T, max(A, hd(T)))
    end.

maximum([]) -> [];
maximum([A]) -> A;
maximum([H|T]) ->
    max(H, maximum(T)).
