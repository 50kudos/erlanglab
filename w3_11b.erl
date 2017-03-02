-module(w3_11b).
-export([twice/1, iterate/1]).

compose(F,G) -> fun(X) -> F(G(X)) end.
id(X) -> X.

% TW_X3 = w3_11b:twice(fun(X) -> X*3 end).
% TW_X3(2) == 18.
%
% TW_TW = w3_11b:twice(fun w3_11b:twice/1).
% TWTW_X3 = TW_TW(fun(X) -> X*3 end).
% TWTW_X3(2) == 162.
% That is 3^4 * 2.
twice(Fn) ->
    compose(Fn,Fn).

iterate(0) -> fun id/1;
iterate(N) when N > 0 ->
    fun(Fn) ->
        lists:foldl(fun compose/2, fun id/1, lists:duplicate(N, Fn))
    end.
