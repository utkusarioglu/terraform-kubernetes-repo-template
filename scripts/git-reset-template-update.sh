#!/bin/bash

update_type=$1

echo "This is an experimental script. It may cause data loss!"
git checkout main
git reset --hard HEAD
git clean -fd
git branch -D chore/${update_type}-template-update
