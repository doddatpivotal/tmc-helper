#!/bin/bash -e

if [ ! $# -eq 1 ]; then
  echo "Must supply custom role file path as args"
  exit 1
fi

ROLE=$(yq e .fullName.name $1)
MATCHING_ROLES=$(tmc iam role list --name $ROLE -oyaml | yq e .totalcount -)
if [ $MATCHING_ROLES == 0 ]; then
    tmc iam role create -f custom-roles/contour-user-role.yaml
    echo "Noop.  Custom role didn't exist"
else
    tmc iam role delete $ROLE
    echo "Custom role deleted: $ROLE"
fi
