-module(my_process).
-export([start/0, say_something/2]).

say_something(_, 0) ->
    done;
say_something(What, Times) ->
    io:format("~p~n", [What]),
    say_something(What, Times - 1).

start() ->
    spawn(my_process, say_something, [hello, 6]),
    spawn(my_process, say_something, [goodbye, 3]).