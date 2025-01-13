#!/bin/bash

erlc queue_app.erl
erl -noshell -s queue_app start -s init stop
rm ./queue_app.beam
