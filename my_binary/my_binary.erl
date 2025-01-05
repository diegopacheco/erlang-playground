-module(my_binary).
-export([start/0]).

start() ->
    Bin11 = <<1, 17, 42>>,
    Bin12 = <<"abc">>,
    io:format("Bin11: ~p~n", [Bin11]),
    io:format("Bin12: ~p~n", [Bin12]).