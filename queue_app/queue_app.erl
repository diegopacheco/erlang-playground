-module(queue_app).
-export([start/0, new/0, enqueue/2, dequeue/1, is_empty/1]).

new() -> [].

enqueue(Queue, Element) ->
    Queue ++ [Element].

dequeue([H|T]) ->
    {H, T};
dequeue([]) ->
    {error, empty}.

is_empty(Queue) -> Queue =:= [].

start() ->
  Queue = queue_app:new(),
  Queue1 = queue_app:enqueue(Queue, 1),
  Queue2 = queue_app:enqueue(Queue1, 2),
  {Element, Queue3} = queue_app:dequeue(Queue2),
  io:format("Dequeued element: ~p~n", [Element]),
  io:format("Is queue empty: ~p~n", [queue_app:is_empty(Queue3)]).