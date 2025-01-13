-module(snake).
-behaviour(gen_server).

-export([start/0, init/1, handle_call/3, handle_cast/2, handle_info/2]).
-export([move/1, change_direction/1]).

-define(BOARD_SIZE, 20).
-define(INTERVAL, 200).

-record(state, {
    snake,          % List of {X,Y} coordinates
    direction,      % north, south, east, west
    food,           % {X,Y}
    game_status     % running or game_over
}).

start() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []),
    setup_terminal(),
    input_loop().

init([]) ->
    Snake = [{?BOARD_SIZE div 2, ?BOARD_SIZE div 2}],
    State = #state{
        snake = Snake,
        direction = east,
        food = generate_food(Snake),
        game_status = running
    },
    timer:send_interval(?INTERVAL, tick),
    {ok, State}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast({change_direction, NewDir}, State) ->
    {noreply, State#state{direction = NewDir}};
handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(tick, State = #state{game_status = running}) ->
    NewState = move_snake(State),
    draw_board(NewState),
    {noreply, NewState};
handle_info(_Info, State) ->
    {noreply, State}.

move_snake(State = #state{snake = Snake, direction = Dir, food = Food}) ->
    [{X, Y} | _] = Snake,
    NewHead = case Dir of
        north -> {X, Y-1};
        south -> {X, Y+1};
        east  -> {X+1, Y};
        west  -> {X-1, Y}
    end,
    NewSnake = [NewHead | case NewHead =:= Food of
        true  -> Snake;
        false -> lists:droplast(Snake)
    end],
    
    case check_collision(NewHead, Snake) of
        true ->
            State#state{game_status = game_over};
        false ->
            NewFood = case NewHead =:= Food of
                true  -> generate_food(NewSnake);
                false -> Food
            end,
            State#state{snake = NewSnake, food = NewFood}
    end.

check_collision({X, Y}, Snake) ->
    X < 1 orelse X > ?BOARD_SIZE orelse
    Y < 1 orelse Y > ?BOARD_SIZE orelse
    lists:member({X, Y}, Snake).

generate_food(Snake) ->
    Position = {rand:uniform(?BOARD_SIZE), rand:uniform(?BOARD_SIZE)},
    case lists:member(Position, Snake) of
        true  -> generate_food(Snake);
        false -> Position
    end.

draw_board(#state{snake = Snake, food = Food, game_status = Status}) ->
    io:format("\033[2J\033[1;1H"),  % Clear screen
    [draw_row(Y, Snake, Food) || Y <- lists:seq(1, ?BOARD_SIZE)],
    case Status of
        game_over -> io:format("Game Over! Score: ~p~n", [length(Snake)]);
        running -> io:format("Score: ~p~n", [length(Snake)])
    end.

draw_row(Y, Snake, Food) ->
    [draw_cell({X,Y}, Snake, Food) || X <- lists:seq(1, ?BOARD_SIZE)],
    io:format("~n").

draw_cell(Pos, Snake, Food) ->
    case {lists:member(Pos, Snake), Pos =:= Food} of
        {true, _}     -> io:format("O");
        {_, true}     -> io:format("@");
        {false, false} -> io:format(".")
    end.

setup_terminal() ->
    os:cmd("stty raw -echo").

input_loop() ->
    case io:get_chars("", 1) of
        "q" -> os:cmd("stty sane"), init:stop();
        "w" -> gen_server:cast(?MODULE, {change_direction, north});
        "s" -> gen_server:cast(?MODULE, {change_direction, south});
        "d" -> gen_server:cast(?MODULE, {change_direction, east});
        "a" -> gen_server:cast(?MODULE, {change_direction, west});
        _   -> ok
    end,
    input_loop().

move(Direction) ->
    gen_server:cast(?MODULE, {change_direction, Direction}).

change_direction(Direction) ->
    gen_server:cast(?MODULE, {change_direction, Direction}).