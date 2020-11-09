#!/bin/sh

echo "------------------------------"
echo "Test01"
echo "This is a null RENAT test case"
echo "------------------------------"

echo "Clone RENAT source"
git clone https://github.com/bachng2017/RENAT.git renat

echo "Create and run project"
export RENAT_PATH=$GITHUB_WORKSPACE/renat
$RENAT_PATH/tools/project.sh sample01
cd sample01
$RENAT_PATH/tools/item.sh -b -l test01
./run.sh

