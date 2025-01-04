-module(my_map).
-export([start/0]).

capitals() ->
    #{ "Germany" => "Berlin",
       "France" => "Paris",
       "US" => "Washington",
       "China" => "Beijing",
       "Japan" => "Tokyo",
       "Brazil" => "Brasilia"
    }.

start() ->
    io:format(" World Capitals: ~p~n", [capitals()]),
    io:format(" Capital of France: ~p~n", [maps:get("France", capitals())]),
    case maps:find("Chile", capitals()) of
        {ok, Capital} -> io:format(" Capital of Chile: ~p~n", [Capital]);
        error -> io:format(" Capital of Chile: not found~n")
    end.
