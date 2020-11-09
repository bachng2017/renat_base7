#!/bin/sh

echo "Test03"
echo "A null project"
echo "-------------"
git clone https://github.com/bachng2017/RENAT.git renat
export RENAT_PATH renat
$RENAT_PATH/tools/project.sh sample01
cd sample01
$RENAT_PATH/tools/item.sh -b -l test01
./run.sh

