#!/usr/bin/env bash
set -e

#Check if .env file is exist then source if any
if [ -f ../.env ]
then
  export $(cat ../.env | xargs)
fi


# Run an individual test suite if the TEST_SUITE environmental variable is set.
if [ -z "$TEST_SUITE" ]; then
    TEST_SUITE=""
fi

CMD="robot --console verbose --outputdir ../result ../TestSuite/$TEST_SUITE"

echo ${CMD}

``${CMD}``