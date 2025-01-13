#!/bin/bash

erlc snake.erl
erl -noshell -s snake start -s init stop
rm ./snake.beam
