-module(my_list_comprehensions).
-export([start/0]).

start() ->
    List = [X || X <- [1,2,a,3,4,b,5,6], X > 3],
    io:format("~p~n", [List]).
