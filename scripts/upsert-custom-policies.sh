SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for file in policy/custom/*
do
  eval "$SCRIPTS_DIR/upsert-org-policy.sh $SCRIPTS_DIR/../$file custom"
done