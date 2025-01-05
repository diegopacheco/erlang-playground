#!/bin/bash

erlc my_list_comprehensions.erl
erl -noshell -s my_list_comprehensions start -s init stop
rm ./my_list_comprehensions.beam
