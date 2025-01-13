#!/bin/bash

erlc stack_app.erl
erl -noshell -s stack_app start -s init stop
rm ./stack_app.beam
