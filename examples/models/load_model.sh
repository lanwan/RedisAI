REDIS_CLI=../../deps/redis/src/redis-cli

echo "SET MODEL"
$REDIS_CLI -x AI.MODELSET foo TF GPU INPUTS a b OUTPUTS mul < graph.pb
$REDIS_CLI AI.MODELGET foo

echo "SET TENSORS"
$REDIS_CLI AI.TENSORSET a FLOAT 2 VALUES 2 3
$REDIS_CLI AI.TENSORSET b FLOAT 2 VALUES 2 3

echo "GET TENSORS"
$REDIS_CLI AI.TENSORGET a VALUES
$REDIS_CLI AI.TENSORGET b VALUES

echo "RUN MODEL"
#$REDIS_CLI AI.MODELRUN foo
#$REDIS_CLI AI.MODELRUN foo INPUTS a
#$REDIS_CLI AI.MODELRUN foo INPUTS a b OUTPUTS
#$REDIS_CLI AI.MODELRUN foo OUTPUTS c
#$REDIS_CLI AI.MODELRUN foo INPUTS a OUTPUTS c
#$REDIS_CLI AI.MODELRUN foo INPUTS a b OUTPUTS c
$REDIS_CLI AI.MODELRUN foo INPUTS a b OUTPUTS c

echo "GET TENSOR META"
$REDIS_CLI AI.TENSORGET c META

echo "GET TENSOR VALUES"
$REDIS_CLI AI.TENSORGET c VALUES

echo "GET TENSOR BLOB"
#$REDIS_CLI --raw AI.TENSORGET c BLOB
$REDIS_CLI AI.TENSORGET c BLOB

$REDIS_CLI DEL foo a b c
