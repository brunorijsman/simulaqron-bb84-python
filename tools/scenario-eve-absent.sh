#!/bin/bash

# TODO: Only set if not already set
KEY_SIZE=32

echo
echo "***** Scenario: Alice and Bob, Eve is absent *****"
echo

# In case it was still running from a previous test
echo "Stopping SimulaQron"
simulaqron stop

echo "Starting SimulaQron"
simulaqron start --force --nodes Alice,Bob --topology path

echo "Starting Alice"
python alice.py "$@" &
alice_pid=$!

echo "Starting Bob"
python bob.py --key-size ${KEY_SIZE} "$@" &
bob_pid=$!

echo "Waiting for Alice to finish"
wait $alice_pid

echo "Waiting for Bob to finish"
wait $bob_pid

echo "Stopping SimulaQron"
simulaqron stop