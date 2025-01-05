#!/bin/bash

erlc +debug_info unit_tests_eunit.erl
erl -noshell -eval "eunit:test(unit_tests_eunit), halt()."