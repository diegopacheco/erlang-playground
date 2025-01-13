-module(guessing_game).
-export([start/0]).

start() ->
    rand:seed(default),
    Target = rand:uniform(100),
    io:format("I've picked a number between 1 and 100~n"),
    play_game(Target, 1).

play_game(Target, Attempts) ->
    Guess = get_guess(),
    case compare_guess(Target, Guess) of
        correct -> 
            io:format("Congratulations! You won in ~p attempts!~n", [Attempts]);
        {wrong, Hint} -> 
            io:format("~s~n", [Hint]),
            play_game(Target, Attempts + 1)
    end.

get_guess() ->
    io:format("Enter your guess: "),
    case io:fread("", "~d") of
        {ok, [Number]} when Number > 0, Number =< 100 ->
            Number;
        _ ->
            io:format("Please enter a number between 1 and 100~n"),
            get_guess()
    end.

compare_guess(Target, Guess) when Guess > Target ->
    {wrong, "Too high!"};
compare_guess(Target, Guess) when Guess < Target ->
    {wrong, "Too low!"};
compare_guess(Target, Target) ->
    correct.