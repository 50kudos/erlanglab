% Resursive function

-module(w1_19_21).
-export([fact/1, fib/1, pieces/1, tFib/1, perfect/1]).

fact(0) -> 1;
fact(N) when N > 0 ->
    fact(N-1) * N.

fib(0) -> 0;
fib(1) -> 1;
fib(N) when N > 1 ->
    fib(N-2) + fib(N-1).

pieces(0) -> 1;
pieces(N) ->
    N + pieces(N-1).

% Tail-recursive function.
%
tFib(N) ->
    tFib(N,0,1).
tFib(0,A1,_) ->
    A1;
tFib(N,A1,A2) when N > 0 ->
    tFib(N-1,A2,A1+A2).

perfect(N) when N > 0 ->
    perfect(N,1,0).
perfect(N,N,A) ->
    N==A;
perfect(N,I,A) ->
    if
        N rem I == 0 ->
            perfect(N,I+1,A+I);
        true ->
            perfect(N,I+1,A)
    end.

