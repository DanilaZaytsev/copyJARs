#!/bin/env bash

source_server="localhost"
target_server=$1

echo "Введи юзера или нажми enter [fitp]"
read -r user
if [ -z "$user" ]
then
  user="fitp"
fi
echo "Введи пасс"
read -r pass
if [ -z "$pass" ]; then
echo "пасс не может быть пустым"
fi

for dir in $(cat ./service.txt); do
  if ! ssh $user@$source_server "test -d \"$dir\""; then
    echo "Source directory $dir does not exist on $source_server"
    exit 1
  fi
  sshpass -p "$pass" scp /opt/fitp/app/"$dir"/*.jar "$user"@"$target_server":/opt/fitp/app/"$dir"
done