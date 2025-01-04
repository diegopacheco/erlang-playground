-module(my_lists).
-export([start/0]).

capitals() ->
    [{moscow, {c, -10}}, {cape_town, {f, 70}}, {stockholm, {c, -4}},
    {paris, {f, 28}}, {london, {f, 36}}].

start() ->
    io:format("Capitals: ~p~n", [capitals()]).