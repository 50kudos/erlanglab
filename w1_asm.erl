-module(w1_asm).
-export([perimeter/1, area/1, areaEnclose/1, perimeterEnclose/1, bits/1]).

%% Shapes
% I am NOT so sure about the requirements, and assume:
%   1. By "smallest enclosing rectangle", means both[0]:
%      - Minimum-area enclosing rectangle
%      - Minimum-perimeter enclosing rectangle
%   2. It does not base on coordinate system.
%
% [0]: https://en.wikipedia.org/wiki/Minimum_bounding_box_algorithms

perimeter({triangle, {A, B, C}}) when A > 0 andalso B > 0 andalso C > 0 ->
    A + B + C.

area({triangle, {A, B, C}}) ->
    if
        A + B > C andalso B + C > A andalso A + C > B ->
            P = perimeter({triangle, {A, B, C}})/2,
            math:sqrt(P * (P-A) * (P-B) * (P-C));
        true ->
            io:format("~s~n", ["Impossible triangle."])
    end.

% Minimum-area enclosing rectangle (2D)
areaEnclose({triangle, {A, B, C}}) ->
    2 * area({triangle, {A, B, C}}).

% Minimum-perimeter enclosing rectangle (2D)
perimeterEnclose({triangle, {A, B, C}}) ->
    2 * (min(A,B) + min(B,C)).


%% Summing the bits

bits(N) when is_integer(N) andalso N >= 0 ->
    BIN = integer_to_list(N, 2),
    lists:foldl(fun(X,ACC) -> (X - 48) + ACC end, 0, BIN).
