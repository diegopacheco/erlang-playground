#!/bin/bash

erlc my_lists.erl
erl -noshell -s my_lists start -s init stop
rm ./my_lists.beam
