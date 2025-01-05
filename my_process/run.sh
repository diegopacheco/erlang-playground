#!/bin/bash

erlc my_process.erl
erl -noshell -s my_process start -s init stop
rm ./my_process.beam
