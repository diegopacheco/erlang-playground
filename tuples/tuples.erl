-module(tuples).
-export([start/0]).
-export([convert_length/1]).

convert_length({centimeter, X}) ->
    {inch, X / 2.54};
convert_length({inch, Y}) ->
    {centimeter, Y * 2.54}.

start() ->
    io:format("conver centimeter to inch: ~p~n", [convert_length({centimeter, 10})]),
    io:format("conver inch to centimeter: ~p~n", [convert_length({inch, 10})]).
