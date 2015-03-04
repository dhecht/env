#!/bin/bash

cd `dirname $0`
dir=`pwd`

for f in .[^.]*
do
 echo "Processing $f file.."
 ln -sf $dir/$f ../$f
done
