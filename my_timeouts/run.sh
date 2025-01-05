#!/bin/bash

erlc my_timeouts.erl
erl -noshell -s my_timeouts start -s init stop
rm ./my_timeouts.beam
