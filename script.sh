#!/bin/env bash

source_server="localhost"
target_server=$1
while source_dir= read -r line;do echo $line; done < service.txt
target_dir="/opt/$source_dir/app"

defuser="fitp"
pass="password"


function copy_jars() {
  for jar_file in $source_dir/*jar; do
    if [ -f "$jar_file" ]; then
      scp $source_dir/*.jar $user@$target_server:$target_dir
    fi
  done
}

if ! ssh $user@$source_server "test -d $source_dir"; then
echo "Source directory $source_dir does not exist on $source_server"
exit 1
fi