-module(mylists).
-export([max/1, min/1, min_max/1]).

max([H|T]) ->
    max(H, T).
max(M, []) ->
    M;
max(M, [H|L]) when M > H ->
    max(M, L);
max(_M, [H|L]) ->
    max(H,L).

min([H|T]) ->
    min(H, T).
min(M, []) ->
    M;
min(M, [H|L]) when M < H ->
    min(M, L);
min(_M, [H|L]) ->
    min(H,L).

min_max(L) ->
    Min = min(L),
    Max = max(L),
    {Min, Max}.