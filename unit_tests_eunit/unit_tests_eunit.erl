-module(unit_tests_eunit).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").

my_add(A, B) ->
    A + B.

my_add_test_() ->
    [
        {"my_add 2+2=4",
        fun() ->
            Result = my_add(2, 2),
            ?debugVal(Result),
            ?assertEqual(4, Result)
        end},
        {"my_add 3+5=8",
        fun() ->
            Result = my_add(3, 5),
            ?debugVal(Result),
            ?assertEqual(8, Result)
        end}
    ].