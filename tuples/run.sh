#!/bin/bash

erlc tuples.erl
erl -noshell -s tuples start -s init stop
rm ./tuples.beam
