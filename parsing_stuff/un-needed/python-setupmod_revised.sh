#!/bin/bash
# The script to set up the Python installation
# Could be used before running things with python or interactive python jobs


#echo $PATH
#pwd

function currentdirno()
{
pwd | sed "s/.*dir_\(.*\)/\1/"
}

CURRENT=$(currentdirno)
CURRENT="$CURRENT\/python\/bin\/python3.6"

cd $(pwd)/python/bin
head -1 pip3

function substitutor()
{
head -1 pip3 | sed "s/.*dir_\(.*\)\/python\/bin\/python3.6/\1/"
}

SUB=$(substitutor)
SUB="$SUB\/python\/bin\/python3.6"

cd ../../
echo $SUB
echo $CURRENT

cd $(pwd)/python/bin
#for file in $(find . -maxdepth 1 -type f -printf "%f\n"); do echo $file; done
for file in $(find . -maxdepth 1 -type f -printf "%f\n"); do sed -i "s/$SUB/$CURRENT/" $file; done


##cd ../../
##head -1 $(pwd)/python/bin/pip3

# Remove the tar file so it is not transferred back
#rm python.tar.gz
