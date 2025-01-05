#!/bin/bash

erlc my_error_handler.erl

erl -sname pong \
    -setcookie abc123 \
    -eval "my_error_handler:pong()" \
    -noshell