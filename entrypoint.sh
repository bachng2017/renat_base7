#!/bin/sh

echo "Clone RENAT source"
git clone https://github.com/bachng2017/RENAT.git renat

echo "Create and run project"
export RENAT_PATH=$GITHUB_WORKSPACE/renat

for item in $(ls -1 test); do
    echo "run test $item"
    cd $item
    ./entrypoint.sh
done



