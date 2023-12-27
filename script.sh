#!/bin/env bash

source_server="localhost"
target_server=$1
source_dir=$(cat service.txt)

echo "Введи юзера или нажми enter"
read -r user
if [ -z "$user" ]
then
  user="fitp"
fi
echo "Введи пасс"
read -r pass

if ! ssh $user@$source_server "test -d \"$source_dir\""; then
  echo "Source directory $source_dir does not exist on $source_server"
  exit 1
fi

for dir in $source_dir; do
  sshpass -p "$pass" scp "$dir"/*.jar $user@"$target_server":"$dir"
done
