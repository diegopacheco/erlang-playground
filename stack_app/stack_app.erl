-module(stack_app).
-export([start/0,create/0, push/2, pop/1, peek/1, is_empty/1]).

create() -> [].

push(Element, Stack) ->
    [Element | Stack].

pop([]) ->
    {error, empty_stack};
pop([Head | Tail]) ->
    {ok, Head, Tail}.

peek([]) ->
    {error, empty_stack};
peek([Head | _]) ->
    {ok, Head}.

is_empty([]) -> true;
is_empty(_) -> false.

start() ->
    Stack0 = create(),
    io:format("Initial stack: ~p~n", [Stack0]),

    Stack1 = push(1, Stack0),
    io:format("After pushing 1: ~p~n", [Stack1]),

    Stack2 = push(2, Stack1),
    io:format("After pushing 2: ~p~n", [Stack2]),

    {ok, Top, Stack3} = pop(Stack2),
    io:format("Popped element: ~p, New stack: ~p~n", [Top, Stack3]),

    {ok, Peeked} = peek(Stack3),
    io:format("Peeked element: ~p~n", [Peeked]),

    Empty = is_empty(Stack3),
    io:format("Is stack empty? ~p~n", [Empty]).