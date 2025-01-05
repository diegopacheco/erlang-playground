#!/bin/bash

erlc my_register_actors.erl
erl -noshell -s my_register_actors start -s init stop
rm ./my_register_actors.beam
