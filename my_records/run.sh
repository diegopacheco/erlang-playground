#!/bin/bash

erlc my_records.erl
erl -noshell -s my_records start -s init stop
rm ./my_records.beam
