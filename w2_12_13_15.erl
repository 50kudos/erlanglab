-module(w2_12_13_15).
-export([take/2, nub/1, palindrome/1]).

-spec take(integer(), [T]) -> T.
take(0, _L) -> [];
take(I, L) when I < 0 orelse I > length(L) -> L;
take(I, [H|T]) ->
    [H | take(I-1, T)].

nub(L) -> nub(lists:sort(L), []).
nub([H|[]], ACC) -> lists:reverse([H | ACC]);
nub([H|T], ACC) ->
    case hd(T) of
        H -> nub(T, ACC);
        _ -> nub(T, [H | ACC])
    end.

palindrome([]) -> false;
palindrome(L) ->
    S = string:to_lower(sanitize(L)),
    S == lists:reverse(S).

sanitize([]) -> [];
sanitize([H|T]) ->
    case lists:member(H, ".,\ ;:\t\n\'\"-_") of
        true ->
            sanitize(T);
        false ->
            [H | sanitize(T)]
    end.
