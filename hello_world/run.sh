#!/bin/bash

erlc hello_world.erl
erl -noshell -s hello_world start -s init stop
rm ./hello_world.beam