-module(factorial).
-export([start/0]).
-export([fac/1]).

fac(1) ->
    1;
fac(N) ->
    N * fac(N - 1).

start() ->
    io:format("Factorial of 5 is ~p~n", [fac(5)]).
