#!/bin/sh

echo "Test03"
echo "A null project"
echo "-------------"
git clone https://github.com/bachng2017/RENAT.git renat
pwd
echo $GITHUB_WORKSPACE
ls $GITHUB_WORKSPACE
export RENAT_PATH=$GITHUB_WORKSPACE/renat
$RENAT_PATH/tools/project.sh sample01
cd sample01
$RENAT_PATH/tools/item.sh -b -l test01
./run.sh

