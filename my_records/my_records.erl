-module(my_records).
-export([start/0]).

-record(person, {name = "", phone = [], address}).

get_person() ->
    #person{name = "John Doe", phone = ["123-4567", "123-4568"], address = {home, "123 Main St"}}.

start() ->
    Person = get_person(),
    io:format("~p~n", [Person]),
    io:format("~p~n", [Person#person.name]),

    Person2 = Person#person{name="Robert"},
    io:format("~p~n", [Person2]).
