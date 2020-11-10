#!/bin/sh

echo "Clone RENAT source"
git clone https://github.com/bachng2017/RENAT.git renat

echo "Create and run project"
export RENAT_PATH=$GITHUB_WORKSPACE/renat

TEST_FOLDER=$GITHUB_WORKSPACE/tests
for item in $(ls -1 $TEST_FOLDER); do
    echo "run test $item"
    cd $item
    ./entrypoint.sh
done



