-module(proc).

-export([start/0, proce/0, proce2/2]).

proce() ->
    receive
        {start, Messages, Pid2} ->
            io:format("Starting~n"),
            [H, M] = Messages,
            Pid2 ! {message, H, self()},
            Pid2 ! {message, M, self()};
        {message, Message, OtherPid} ->
            io:format("Enter message: " ++ Message ++ " replying ~n"),
            OtherPid ! {reply, Message ++ " Received~n"};
        {finished} ->
            ok
    end,
    proce().

proce2([], Pid) ->
    Pid ! {finished},
    ok;
proce2(Messages, Pid) -> 
    [Curr|Rem] = Messages,
    Pid ! {message, Curr, self()},
    receive 
        {reply, Message} ->
            io:format("Received reply: " ++ Message)
    end,
    proce2(Rem, Pid),
    ok.

start() ->
    Pid1 = spawn(?MODULE, proce, []),
    spawn(?MODULE, proce2, [["Hello", "Hello2"], Pid1]),
    ok.