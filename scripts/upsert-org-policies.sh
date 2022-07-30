#!/bin/bash -e

: ${PARAMS_YAML?"Need to set PARAMS_YAML environment variable"}

if [ ! $# -eq 1 ]; then
  echo "Must policy type as args"
  exit 1
fi

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

POLICY_TYPE=$1

for file in policy/$POLICY_TYPE/*
do
  eval "$SCRIPTS_DIR/upsert-org-policy.sh $file $POLICY_TYPE"
done