#!/usr/bin/env bash

set -e

echo "test: integration.sh"
echo "test: running from `pwd`"

echo "test: v556702-nosegfault"
./rbc-combine test/fixture/v556702-nosegfault/*.run > /dev/null

echo "test: v556702-segfault"
# setup run files
if [ ! -f "test/fixture/v556702-segfault/bm25.run" ]; then
    echo "test: extracting bm25.run.xz"
    xz -dkv test/fixture/v556702-segfault/bm25.run.xz
fi
if [ ! -f "test/fixture/v556702-segfault/minilm.run" ]; then
    echo "test: extracting minilm.run.xz"
    xz -dkv test/fixture/v556702-segfault/minilm.run.xz
fi
./rbc-combine test/fixture/v556702-segfault/*.run > /dev/null

echo "test: no lazy-topic"
RESULT=$(./rbc-combine test/fixture/lazy-topic/{a,a}.run | wc -l)
test $RESULT = "50"
echo "test: warn when lazy-topic"
./rbc-combine test/fixture/lazy-topic/{a,b}.run 2>&1 > /dev/null | grep -q ^warn

echo "test: passed"
