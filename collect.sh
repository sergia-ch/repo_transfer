#!/bin/bash
if [ "X$1" == "X" ]
then
  echo "Usage: $0 list_dir"
  exit 1
fi

echo "Running at $1"
echo -n | tee output.txt
OUT_DIR=$(pwd)

# try detecting a repo and going into subdirs
function run_in_folder() {
  if [ -d "$1/.git" ]
  then
    echo "== git repo $1 ==" | tee -a $OUT_DIR/output.txt
    cat $1/.git/config | tee -a $OUT_DIR/output.txt
    echo "== end ==" | tee -a $OUT_DIR/output.txt
    return
  fi

  for d in $(ls $1)
  do
    if [ -d "$1/$d" ]
    then
      run_in_folder "$1/$d"
    fi
  done
}

# starting from $1
cd $1
run_in_folder .
