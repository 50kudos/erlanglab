% Basic functions

-module(w1_9_a).
-export([double/1, square/1, treble/1]).

mult(X,Y) ->
    X * Y.

double(X) ->
    mult(2,X).

square(X) ->
    X * X.

treble(X) ->
    double(X) + X.
