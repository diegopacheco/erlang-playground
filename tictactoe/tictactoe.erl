-module(tictactoe).
-export([start/0]).

start() ->
    Board = [[" "," "," "],
             [" "," "," "],
             [" "," "," "]],
    play_game(Board, "X").

play_game(Board, Player) ->
    display_board(Board),
    case check_winner(Board) of
        {winner, Winner} ->
            io:format("Player ~s wins!~n", [Winner]);
        draw ->
            io:format("It's a draw!~n");
        no_winner ->
            io:format("Player ~s's turn. Enter row,col (1-3,1-3): ", [Player]),
            case io:get_line("") of
                eof -> ok;
                Line ->
                    try
                        [RowStr, ColStr] = string:tokens(string:trim(Line), ","),
                        Row = list_to_integer(RowStr),
                        Col = list_to_integer(ColStr),
                        case make_move(Board, Row-1, Col-1, Player) of
                            {ok, NewBoard} ->
                                NextPlayer = case Player of
                                    "X" -> "O";
                                    "O" -> "X"
                                end,
                                play_game(NewBoard, NextPlayer);
                            invalid_move ->
                                io:format("Invalid move! Try again.~n"),
                                play_game(Board, Player)
                        end
                    catch
                        _:_ ->
                            io:format("Invalid input! Use format: row,col~n"),
                            play_game(Board, Player)
                    end
            end
    end.

display_board(Board) ->
    io:format("~n"),
    lists:foreach(fun(Row) ->
        io:format(" ~s | ~s | ~s~n", Row),
        io:format("-----------~n")
    end, Board).

make_move(Board, Row, Col, Player) when Row >= 0, Row < 3, Col >= 0, Col < 3 ->
    CurrentRow = lists:nth(Row + 1, Board),
    case lists:nth(Col + 1, CurrentRow) of
        " " ->
            NewRow = lists:sublist(CurrentRow, Col) ++ [Player] ++ lists:nthtail(Col + 1, CurrentRow),
            {ok, lists:sublist(Board, Row) ++ [NewRow] ++ lists:nthtail(Row + 1, Board)};
        _ ->
            invalid_move
    end;
make_move(_, _, _, _) ->
    invalid_move.

check_winner(Board) ->
    case check_lines(Board) of
        {winner, Winner} -> {winner, Winner};
        no_winner ->
            case check_columns(Board) of
                {winner, Winner} -> {winner, Winner};
                no_winner ->
                    case check_diagonals(Board) of
                        {winner, Winner} -> {winner, Winner};
                        no_winner ->
                            case is_board_full(Board) of
                                true -> draw;
                                false -> no_winner
                            end
                    end
            end
    end.

check_lines(Board) ->
    check_rows(Board).

check_rows([]) ->
    no_winner;
check_rows([[X,X,X]|_]) when X =/= " " ->
    {winner, X};
check_rows([_|Rest]) ->
    check_rows(Rest).

check_columns(Board) ->
    Transposed = lists:zip3(
        lists:nth(1, Board),
        lists:nth(2, Board),
        lists:nth(3, Board)
    ),
    check_rows([tuple_to_list(Row) || Row <- Transposed]).

check_diagonals(Board) ->
    Diag1 = [lists:nth(1, lists:nth(1, Board)),
             lists:nth(2, lists:nth(2, Board)),
             lists:nth(3, lists:nth(3, Board))],
    Diag2 = [lists:nth(3, lists:nth(1, Board)),
             lists:nth(2, lists:nth(2, Board)),
             lists:nth(1, lists:nth(3, Board))],
    check_rows([Diag1, Diag2]).

is_board_full(Board) ->
    not lists:any(fun(Row) ->
        lists:any(fun(Cell) -> Cell == " " end, Row)
    end, Board).