-module(third).
-export([maxThree/3,howManyEqual/3,eXOR/2]).

eXOR(X,Y) when is_boolean(X) andalso is_boolean(Y) ->
    case {X,Y} of
        {Y,X} -> false;
        _ -> true
    end.

maxThree(A,B,C) when is_integer(A) andalso is_integer(B) andalso is_integer(C) ->
    max(max(A,B),C).

howManyEqual(A,B,C) when is_integer(A) andalso is_integer(B) andalso is_integer(C) ->
    case {A,B,C} of
        {_,A,A} -> 3;
        {B,A,_} -> 2;
        {C,_,A} -> 2;
        {_,C,B} -> 2;
        {_,_,_} -> 0
    end.
