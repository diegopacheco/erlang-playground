#!/bin/bash

erlc higher_order_functions.erl
erl -noshell -s higher_order_functions start -s init stop
rm ./higher_order_functions.beam
