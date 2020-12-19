#!/bin/sh
# This is the entry point for the RENAT base system
# By default, it will to run every a script call entrypoint.sh in very sub folder under
# $$TEST_FOLDER

echo "run all test cases in tests folder"
echo "----------------------------------"
export RENAT_PATH=$GITHUB_WORKSPACE/renat

# default test folder. Need to be an absolute path
TEST_FOLDER=$GITHUB_WORKSPACE/tests 
# entrypoint script. Default is entrypoint.sh
ENTRY_POINT=entrypoint.sh
RETURN=0
for item in $(find $TEST_FOLDER -depth  -type f -name $ENTRY_POINT); do
    echo
    echo
    echo 
    echo 
    export CURRENT_DIR=$(dirname $item)
    cd $CURRENT_DIR
    echo "Run test in $CURRENT_DIR"
    $item
    RETURN=$(expr $RETURN + $?)
done

echo "--------------------"
echo "Exit code is $RETURN"
exit $RETURN



