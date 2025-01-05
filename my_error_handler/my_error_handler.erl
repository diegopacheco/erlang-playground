-module(my_error_handler).
-export([start/0, start/1, ping/2, ping1/2, pong/0, pong1/0]).

ping(N, Pong_Pid) ->
    link(Pong_Pid),
    ping1(N, Pong_Pid).

ping1(0, _) ->
    exit(ping);

ping1(N, Pong_Pid) ->
    Pong_Pid ! {ping, self()},
    receive
        pong ->
            io:format("Ping received pong~n", [])
    end,
    ping1(N - 1, Pong_Pid).

pong() ->
    process_flag(trap_exit, true),
    pong1().

pong1() ->
    receive
        {ping, Ping_PID} ->
            io:format("Pong received ping~n", []),
            Ping_PID ! pong,
            pong1();
        {'EXIT', From, Reason} ->
            io:format("pong exiting, got ~p~n", [{'EXIT', From, Reason}])
    end.

start() ->
    PongPID = spawn(my_error_handler, pong, []),
    spawn(my_error_handler, ping, [3, PongPID]).

start(Pong_Node) ->
    PongPID = spawn(Pong_Node, my_error_handler, pong, []),
    spawn(my_error_handler, ping, [3, PongPID]).