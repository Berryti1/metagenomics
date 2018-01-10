#!/bin/sh

#Establish connection with JGI portal and login
curl 'https://signon.jgi.doe.gov/signon/create' --data-urlencode 'login=tdberry@wisc.edu' --data-urlencode 'password=5gwiabaoc!' -c cookies > /dev/null

#Download metagenome from JGI portal

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_243_MG/download/_JAMO/58660cd67ded5e78cff923b9/11202.7.196021.GGCTAC.filter-METAGENOME.fastq.gz' -b cookies > 243_MG_QC.fastq.gz

#Untar python install and set in path
tar -xf python.tar.gz
export PATH=$(pwd)/python/bin:$PATH

#Finds the file in directory ending with .fastq.gz and runs parse on it. 
for file in $(find *.fastq.gz  -maxdepth 1 -type f -printf "%f\n"); do python parse.py $file $file ; done

#tar up the de_interleaved files and transfer to gluster
tar -czvf 243_deinterleaved.tar.gz *.fq
cp 243_deinterleaved.tar.gz /mnt/gluster/tdberry

# cleanup so extra files aren't transferred back
rm parse.py
rm *.fq 
rm *.gz 
rm cookies 

