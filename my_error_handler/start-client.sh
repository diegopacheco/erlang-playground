#!/bin/bash

erlc my_error_handler.erl

# Start client node with distributed erlang connection
sleep 2
erl -sname ping \
    -setcookie abc123 \
    -eval "case net_adm:ping('pong@$(hostname)') of \
            pong -> my_error_handler:start('pong@$(hostname)'); \
            pang -> io:format(\"Failed to connect to pong node~n\") \
        end." \
    -noshell