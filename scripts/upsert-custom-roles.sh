SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for file in custom-roles/*
do
  eval "$SCRIPTS_DIR/upsert-custom-role.sh $file"
done 
