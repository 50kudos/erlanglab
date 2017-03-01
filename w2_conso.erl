-module(w2_conso).
-export([concat/1, join/2, member/2, merge_sort/1, quick_sort/1, insertion_sort/1, perms/1]).

join([],R) -> R;
join([L|Ls],R) ->
    [L | join(Ls,R)].

concat([]) -> [];
concat([H|T]) -> join(H, concat(T)).


member(_,[]) -> false;
member(M,[M|_]) -> true;
member(M,[_L|Ls]) ->
    member(M,Ls).


merge_sort([]) -> [];
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


% Rotation position range is from 0 to (length-2).
perms([]) -> [];
perms(L) -> perms(L, 0, permute(L,L,0,[])).
perms(L, I, ACC) when I > length(L) - 2 -> ACC;
perms(L, I, ACC) ->
    Result = lists:foldr(fun(X,C) -> permute(X,X,I+1,[]) ++ C end, [], ACC),
    perms(L, I+1, Result).

permute(L, L0, I, ACC) when I > length(L) - 2 -> [L0|ACC];
permute(L, L0, I, ACC) ->
    case R = rotate(L, I) of
        L0 -> [L0|ACC];
        _ -> permute(R, L0, I, [R|ACC])
    end.

% Receive list and fixed position.
% The fixed position remains while rotating lists.
rotate([],_) -> [];
rotate(L, 0) -> shiftr(L,L);
rotate([H|T], F) -> [H | rotate(T, F-1)].

shiftr([A|[]], L0) -> [A | L0--[A]];
shiftr([_I|Is], L0) -> shiftr(Is, L0).
