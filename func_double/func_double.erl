-module(func_double).
-export([start/0]).
-export([double/1]).

double(X) ->
    2 * X.

start() ->
    io:format("Double of 2 is ~p~n", [double(2)]).
