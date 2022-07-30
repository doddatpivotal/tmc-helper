#!/bin/bash -e

if [ ! $# -eq 1 ]; then
  echo "Must supply custom role file path as args"
  exit 1
fi

CUSTOM_ROLE_YAML_FILE=$1
echo "Upserting $CUSTOM_ROLE_YAML_FILE"

ROLE=$(yq e .fullName.name $CUSTOM_ROLE_YAML_FILE)
MATCHING_ROLES=$(tmc iam role list --name $ROLE -oyaml | yq e .roles - | yq e 'length' -)

if [ "$MATCHING_ROLES" == "0" ]; then
    echo "Creating role: $ROLE"
    tmc iam role create -f $CUSTOM_ROLE_YAML_FILE
    echo "Custom role created: $ROLE"
else
    echo "Updating role: $ROLE"
    tmc iam role update -f $CUSTOM_ROLE_YAML_FILE
    echo "Custom role updated: $ROLE"
fi
