#!/bin/bash

project_name=$(basename "$PWD")

echo "-module($project_name).
-export([start/0]).

start() ->
    io:format(\"Hello, World!~n\")." > $project_name.erl

echo "#!/bin/bash

erlc $project_name.erl
erl -noshell -s $project_name start -s init stop
rm ./$project_name.beam" > run.sh

chmod +x run.sh

touch README.md