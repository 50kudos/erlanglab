-module(w2_conso).
-export([concat/1, join/2, member/2, merge_sort/1, quick_sort/1, insertion_sort/1, permute/1]).

join([],R) -> R;
join([L|Ls],R) ->
    [L | join(Ls,R)].


concat([]) -> [];
concat([H|T]) -> join(H, concat(T)).


member(_,[]) -> false;
member(M,[M|_]) -> true;
member(M,[M|_]) -> true;
member(M,[_L|Ls]) ->
    member(M,Ls).


merge_sort([A]) -> [A];
merge_sort(A) ->
    M = length(A) div 2,
    {L,R} = lists:split(M,A),
    merge(merge_sort(L), merge_sort(R)).

merge([],R) -> R;
merge(L,[]) -> L;
merge([L|Ls],[R|Rs]) ->
    case L < R of
        true ->
            [L | merge(Ls,[R|Rs])];
        _ ->
            [R | merge([L|Ls],Rs)]
    end.


quick_sort([]) -> [];
quick_sort([P|R]) ->
    {A,B} = lists:partition(fun(X) -> X < P end, R),
    quick_sort(A) ++ [P] ++ quick_sort(B).


insertion_sort(A) -> lists:foldl(fun insert/2, [], A).
insert(X,[]) -> [X];
insert(X,[H|_T]=A) when X =< H -> [X|A];
insert(X,[H|T]) when X > H -> [H | insert(X,T)].


permute(L) -> lists:append(perms(L)).
perms([]) -> [[]];
perms(L) -> perms(L, L).

perms([],_) -> [];
perms([I|Is], L0) ->
    T = perms(L0--[I]),
    [cross(I, T) | perms(Is, L0)].

cross(_X, []) -> [];
cross(X, [[]]) -> [[X]];
cross(X, [[H]|T]) -> [[X|H] | cross(X, T)];
cross(X, [H|T]) -> [[X|H] | cross(X, T)].
