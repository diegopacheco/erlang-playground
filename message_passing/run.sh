#!/bin/bash

erlc message_passing.erl
erl -noshell -s message_passing start -s init stop
rm ./message_passing.beam
