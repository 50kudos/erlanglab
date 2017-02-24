% Using external modules

-module(w1_9_b).
-export([hypotenuse/2, perimeter/2, area/2]).

hypotenuse(A,B) ->
    math:sqrt(w1_9_a:square(A) + w1_9_a:square(B)).

perimeter(A,B) ->
    A + B + hypotenuse(A,B).

area(A, B) ->
    (A * B) / 2.
