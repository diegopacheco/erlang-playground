#!/bin/bash

erlc if_and_case.erl
erl -noshell -s if_and_case start -s init stop
rm ./if_and_case.beam
