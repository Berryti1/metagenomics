#!/bin/sh

cp /mnt/gluster/tdberry/MG_QC_files_mini_12.tar.gz ./

tar -xf MG_QC_files_mini_12.tar.gz

# get args
input_file=$1
output_basename=$2

# untar python install and set in path
tar -xf python.tar.gz
export PATH=$(pwd)/python/bin:$PATH

# run parse.py with args
python parse.py $input_file $output_basename

# cleanup so extra files aren't transferred back
rm python.tar.gz parse.py $input_file
