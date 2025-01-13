#!/bin/bash

erlc tictactoe.erl
erl -noshell -s tictactoe start -s init stop
rm ./tictactoe.beam
