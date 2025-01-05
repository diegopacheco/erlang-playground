#!/bin/bash

erlc my_binary.erl
erl -noshell -s my_binary start -s init stop
rm ./my_binary.beam
