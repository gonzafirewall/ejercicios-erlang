-module(time).

-export([swedish_date/0]).

swedish_date() ->
    {Y, M, D} = erlang:date(),
    D2 = string:right(integer_to_list(D), 2, $0),
    M2 = string:right(integer_to_list(M), 2, $0),
    {_ , Y2} = lists:split(2, integer_to_list(Y)),
    lists:concat([Y2, M2, D2]).