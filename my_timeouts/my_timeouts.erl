-module(my_timeouts).
-export([start/0, start_ping/1, start_pong/0, ping/2, pong/0]).

ping(0, _Pong_Node) ->
    io:format("ping finished~n", []);
ping(N, Pong_Node) ->
    {pong, Pong_Node} ! {ping, self()},
    receive
        pong ->
            io:format("Ping received pong~n", [])
    end,
    ping(N - 1, Pong_Node).

pong() ->
    receive
        {ping, Ping_PID} ->
            io:format("Pong received ping~n", []),
            Ping_PID ! pong,
            pong()
    after 100 ->
            io:format("Pong timed out~n", [])
    end.

start_pong() ->
    register(pong, spawn(my_timeouts, pong, [])).

start_ping(Pong_Node) ->
    spawn(my_timeouts, ping, [3, Pong_Node]).

start() ->
    start_pong(),
    start_ping(node()).