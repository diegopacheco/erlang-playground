-module(my_functions).
-export([start/0]).

foreach(F, [H|T]) ->
    F(H),
    foreach(F, T);
foreach(_, []) ->
    ok.

foldl(F, Accu, [Hd|Tail]) ->
    foldl(F, F(Hd, Accu), Tail);
foldl(_, Accu, []) -> Accu.

filter(F, [H|T]) ->
    case F(H) of
        true  -> [H|filter(F, T)];
        false -> filter(F, T)
    end;
filter(_, []) -> [].

map(F, [H|T]) -> [F(H)|map(F, T)];
map(_, [])    -> [].

start() ->
    io:format("Foreach [1,2,3,4,5,6] ~p~n", 
        [foreach(fun(X) -> io:format("~p~n", [X]) end, [1,2,3,4,5,6])]),
    
    io:format("Foldl [1,2,3,4,5,6] ~p~n",
        [foldl(fun(X, Accu) -> X + Accu end, 0, [1,2,3,4,5,6])]),
    
    io:format("Filter [1,2,3,4,5,6] ~p~n",
        [filter(fun(X) -> X rem 2 == 0 end, [1,2,3,4,5,6])]),

    io:format("Map [1,2,3,4,5,6] ~p~n",
        [map(fun(X) -> X * 2 end, [1,2,3,4,5,6])]).
