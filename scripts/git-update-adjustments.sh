#!/bin/bash

source scripts/config.sh
check_repo_config
source scripts/git-facades.sh

git_origin_update() {
  record_target=$1
  template_repo_url=$2
  if [ ! -f $record_target ];
  then
    touch $record_target
  else
    sed -i '/TEMPLATE_REPO_URL/d' $record_target 
  fi
  echo "TEMPLATE_REPO_URL=$template_repo_url" >> $record_target
}

template_repo_url=$1
repo_class=$2
repo_service=$3
repo_path=$4
record_target=$5

current=$(cat .devcontainer/devcontainer.json | jq -r '.name')
replacement=$repo_class
find . -type f \( ! -iwholename "./scripts/setup.sh" ! -iname ".git" \) -exec sed -i "s:$current:$replacement:g" {} \;

current=$(cat .devcontainer/devcontainer.json | jq -r '.workspaceFolder')
replacement=$repo_path
find . -type f \( ! -iwholename "./scripts/setup.sh" ! -iname ".git" \) -exec sed -i "s:$current:$replacement:g" {} \;

current=$(cat .devcontainer/devcontainer.json | jq -r '.service')
replacement=$repo_service
find . -type f \( ! -iwholename "./scripts/setup.sh" ! -iname ".git" \) -exec sed -i "s:$current:$replacement:g" {} \;

git_template_repo_url_update $record_target $template_repo_url
