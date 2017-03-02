-module(w3_5).
-export([doubleAll/1, evens/1, product/1, zip_/2, zip/2, zip_with_/3, zip_with/3]).

% doubleAll([]) -> [];
% doubleAll([X|Xs]) ->
%     [ 2*X | doubleAll(Xs) ].
doubleAll(L) ->
    lists:map(fun double/1, L).
double(X) -> 2 * X.


% evens([]) -> [];
% evens([X|Xs]) when X rem 2 == 0 ->
%     [X | evens(Xs) ];
% evens([_|Xs]) ->
%     evens(Xs).
evens(L) ->
    lists:filter(fun even/1, L).
even(X) -> X rem 2 == 0.


% product([]) -> 1;
% product([X|Xs]) -> X * product(Xs).
product(L) ->
    lists:foldl(fun multiply/2, 1, L).
multiply(X, ACC) -> X * ACC.


% a) zip([1,3,5,7], [2,4]) = [ {1,2}, {3,4} ]
zip_(_,[]) -> [];
zip_([],_) -> [];
zip_([X|Xs], [Y|Ys]) ->
   [{X,Y} | zip_(Xs,Ys)].

% b) zip_with(fun(X,Y) -> X+Y end, [1,3,5,7], [2,4]) = [ 3, 7 ]
zip_with_(_Fun, _, []) -> [];
zip_with_(_Fun, [], _) -> [];
zip_with_(Fun, [X|Xs], [Y|Ys]) ->
    [Fun(X,Y) | zip_with_(Fun, Xs, Ys)].


% c) Re-define the function zip_with/3 using zip and lists:map
% High order function version.
zip_with(Fun, Xs, Ys) ->
    lists:map(fun({X,Y}) -> Fun(X,Y) end, zip_(Xs,Ys)).

% d) Re-define zip/2 using zip_with/3.
% High order function version.
zip(Xs,Ys) ->
    zip_with(fun(X,Y) -> {X,Y} end, Xs, Ys).
