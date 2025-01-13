#!/bin/bash

erlc guessing_game.erl
erl -noshell -s guessing_game start -s init stop
rm ./guessing_game.beam
