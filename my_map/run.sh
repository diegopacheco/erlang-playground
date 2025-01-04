#!/bin/bash

erlc my_map.erl
erl -noshell -s my_map start -s init stop
rm ./my_map.beam
