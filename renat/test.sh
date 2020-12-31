#!/bin/sh

export RENAT_PATH=$GITHUB_WORKSPACE/renat

echo "run all shell test cases"
echo "----------------------------------"

CODE=0

# default test folder. Need to be an absolute path
TEST_FOLDER=test_shell
ENTRY_POINT=run.sh
for item in $(find $TEST_FOLDER -depth  -type f -name $ENTRY_POINT); do
    echo
    echo
    echo 
    echo 
    export CURRENT_DIR=$(dirname $item)
    cd $CURRENT_DIR
    echo "Run test in $CURRENT_DIR"
    $item
    CODE=$(expr $RETURN + $?)
done


echo "run the renat test project"
echo "----------------------------------"
sudo -s -u robot
cd /home/robot/work/test_renat
./run.sh
CODE=$(expr $RETURN + $?)

echo "--------------------"
echo "Exit code is $RETURN"
exit $CODE
