#!/bin/bash

erlc my_list_comprehensions2.erl
erl -noshell -s my_list_comprehensions2 start -s init stop
rm ./my_list_comprehensions2.beam
