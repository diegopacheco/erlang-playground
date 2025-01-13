#!/bin/bash

erlc fibo.erl
erl -noshell -s fibo start -s init stop
rm ./fibo.beam
