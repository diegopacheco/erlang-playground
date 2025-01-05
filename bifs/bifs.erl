-module(bifs).
-export([start/0]).

start() ->
    io:format("trunc trunc(5.6). ~p~n", [trunc(5.6)]),
    io:format("round round(5.6). ~p~n", [round(5.6)]),
    io:format("length length([1,2,3]). ~p~n", [length([1,2,3])]),
    io:format("float float(5). ~p~n", [float(5)]),
    io:format("is_atom is_atom(abc). ~p~n", [is_atom(abc)]),
    io:format("is_atom is_atom(\"5\"). ~p~n", [is_atom("5")]),
    io:format("is_tuple is_tuple({a,b,c}). ~p~n", [is_tuple({a,b,c})]).


