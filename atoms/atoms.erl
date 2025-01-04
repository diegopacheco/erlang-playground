-module(atoms).
-export([start/0]).
-export([convert/2]).

convert(M, inch) ->
    M / 2.54;

convert(N, centimeter) ->
    N * 2.54.

start() ->
    io:format("convert 3 inch to centimeter: ~p~n", [convert(3, inch)]),
    io:format("convert 3 centimeter to inch: ~p~n", [convert(3, centimeter)]).