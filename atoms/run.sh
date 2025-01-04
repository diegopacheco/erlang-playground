#!/bin/bash

erlc atoms.erl
erl -noshell -s atoms start -s init stop
rm ./atoms.beam
