#!/bin/bash

erlc factorial.erl
erl -noshell -s factorial start -s init stop
rm ./factorial.beam
