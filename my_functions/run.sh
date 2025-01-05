#!/bin/bash

erlc my_functions.erl
erl -noshell -s my_functions start -s init stop
rm ./my_functions.beam
