#!/bin/bash

erlc bifs.erl
erl -noshell -s bifs start -s init stop
rm ./bifs.beam
