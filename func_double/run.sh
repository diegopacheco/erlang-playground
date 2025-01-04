#!/bin/bash

erlc func_double.erl
erl -noshell -s func_double start -s init stop
rm ./func_double.beam
