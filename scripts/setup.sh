#!/bin/bash

repo_name=tf-k8s-repo-template
repo_type_plural=templates
repo_type_singular=template

current=terraform-kubernetes-repo-template.templates.utkusarioglu.com
replacement=$repo_name.$repo_type_plural.utkusarioglu.com
find . -type f \( ! -iwholename "./scripts/setup.sh" ! -iname ".git" \) -exec sed -i "s:$current:$replacement:g" {} \;

current=/utkusarioglu-com/templates/terraform-kubernetes-repo-template
replacement=/utkusarioglu-com/$repo_type_plural/$repo_name
find . -type f \( ! -iwholename "./scripts/setup.sh" ! -iname ".git" \) -exec sed -i "s:$current:$replacement:g" {} \;

current=terraform-kubernetes-repo-template
replacement=$repo_name
find . -type f \( ! -iwholename "./scripts/setup.sh" ! -iname ".git" \) -exec sed -i "s:$current:$replacement:g" {} \;
