#!/bin/sh

#copy over files from gluster and extract from tarball
cp /mnt/gluster/tdberry/JGI_metagenomes.tar.gz ./
tar -xf JGI_metagenomes.tar.gz

# untar python install and set in path
tar -xf python.tar.gz
export PATH=$(pwd)/python/bin:$PATH


for file in $(find *.fastq.gz  -maxdepth 1 -type f -printf "%f\n"); do python parse.py $file $file ; done

#tar up the de_interleaved files and transfer to gluster
tar -czvf de_interleaved_files_complete.tar.gz *.fq
cp de_interleaved_files_completed.tar.gz /mnt/gluster/tdberry

# cleanup so extra files aren't transferred back
rm parse.py *.fq *.gz  
