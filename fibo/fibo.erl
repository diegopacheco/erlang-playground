-module(fibo).
-export([start/0, fib/1]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) when N > 1 -> fib(N-1) + fib(N-2).

start() ->
    Sequence = [fib(X) || X <- lists:seq(0, 10)],
    io:format("Fibonacci Sequence: ~p~n", [Sequence]).