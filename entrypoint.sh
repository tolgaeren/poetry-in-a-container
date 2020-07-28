#!/bin/bash

# from https://github.com/abatilo/actions-poetry/blob/master/entrypoint.sh 
set -e

# Push current directory on to stack and cd (if possible) into working dir.
pushd . > /dev/null 2>&1 || return
cd "$INPUT_WORKING_DIRECTORY" || return
echo working directory is: $INPUT_WORKING_DIRECTORY
echo $PWD
ls -al ..

sh -c "poetry $*"

# Step back to starting directory.
popd > /dev/null 2>&1 || return