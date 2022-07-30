#!/bin/bash -e

: ${PARAMS_YAML?"Need to set PARAMS_YAML environment variable"}

if [ ! $# -eq 2 ]; then
  echo "Must policy file path as args"
  exit 1
fi

POLICY_YAML_FILE=$1
POLICY_TYPE=$2
echo "Upserting $POLICY_YAML_FILE"

GENERATED_FILE=generated/$POLICY_YAML_FILE
DIR="$(dirname "${VAR}")"

mkdir -p $(dirname $GENERATED_FILE)
ytt -f $POLICY_YAML_FILE -f $PARAMS_YAML > $GENERATED_FILE

POLICY=$(yq e .fullName.name $GENERATED_FILE)

# Need to first test for no image policy text because this command does not return an empty array
TEST_FOR_NO_POLICIES=$(tmc organization $POLICY_TYPE-policy list -o yaml)
if tmc organization $POLICY_TYPE-policy list | grep "policies to list" ; [ $? -eq 0 ]; then
  echo "Creating policy: $POLICY"
  tmc organization $POLICY_TYPE-policy create -f $GENERATED_FILE
  echo "Policy created: $POLICY"
else
  # test for matching amongst some
  MATCHING_POLICIES=$(tmc organization $POLICY_TYPE-policy list -o yaml | yq e '[.policies[] | select(.fullName.name=="'$POLICY'")]' | yq e 'length' -)
  if [ "$MATCHING_POLICIES" == "0" ]; then
      echo "Creating policy: $POLICY"
      tmc organization $POLICY_TYPE-policy create -f $GENERATED_FILE
      echo "Policy created: $POLICY"
  else
      echo "Updating policy: $POLICY"
      tmc organization $POLICY_TYPE-policy update -f $GENERATED_FILE
      echo "Policy updated: $POLICY"
  fi
fi
