#!/bin/bash
unset FILESYSTEM_PREFIX
export TARGET_FILESYSTEM=isilon
source $IMPALA_HOME/bin/impala-config.sh &> /dev/null
echo "Isilon Environment: "
env | grep -i isilon
