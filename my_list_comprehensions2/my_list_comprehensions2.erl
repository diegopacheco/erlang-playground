-module(my_list_comprehensions2).
-export([start/0]).

start() ->
    List = [X || X <- [1,2,a,3,4,b,5,6], is_integer(X), X > 3],
    io:format("~p~n", [List]).
