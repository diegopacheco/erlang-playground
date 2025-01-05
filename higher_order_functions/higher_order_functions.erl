-module(higher_order_functions).
-export([start/0]).

double(X) -> 2 * X.

start() ->
    Add3 = fun(X) -> X + 3 end,
    io:format("double(5) = ~p~n", [double(5)]),
    io:format("add3(5) = ~p~n", [Add3(5)]).