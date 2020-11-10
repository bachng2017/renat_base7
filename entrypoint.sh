#!/bin/sh
# This is the entry point for the RENAT base system
# By default, it will to run every a script call entrypoint.sh in very sub folder under
# $$TEST_FOLDER

echo "Clone RENAT source"
git clone https://github.com/bachng2017/RENAT.git renat

echo "Create and run project"
export RENAT_PATH=$GITHUB_WORKSPACE/renat

# default test folder. Need to be an absolute path
TEST_FOLDER=$GITHUB_WORKSPACE/tests 
# entrypoint script. Default is entrypoint.sh
ENTRY_POINT=entrypoint.sh
RETURN=0
for item in $(find $TEST_FOLDER -depth  -type f -name $ENTRY_POINT); do
    export CURRENT_DIR=$(dirname $item)
    echo "run test in $CURRENT_DIR"
    cd $CURRENT_DIR
    pwd
    $item
    RETURN=$(expr $RETURN + $?)
done
echo "exit code is $RETURN"
exit $RETURN



