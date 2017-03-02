-module(w3_11a).
-export([fn_composer/1, fog/1, gof/1, goh/1, hog/1]).

f(X) -> 2*X + 5.
g(X) -> (X-5) / 2.
h(X) -> X*X - 1.
id(X) -> X.

compose(F,G) -> fun(X) -> F(G(X)) end.

fn_composer(Fns) ->
    lists:foldl(fun compose/2, fun id/1, Fns).

% Examples for invertible functions.
% fog(500) == gof(500).
fog(X) ->
    (fn_composer([fun g/1, fun f/1]))(X).
gof(X) ->
    (fn_composer([fun f/1, fun g/1]))(X).

% Examples for non-invertible functions.
% goh(50) =/= hog(50).
goh(X) ->
    (fn_composer([fun h/1, fun g/1]))(X).
hog(X) ->
    (fn_composer([fun g/1, fun h/1]))(X).
