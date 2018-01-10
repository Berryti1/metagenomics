#!/bin/bash 

tar -xzf python.tar.gz
tar -xzf quast-4.6.1.tar.gz

cp /mnt/gluster/twhitman/202_trim_test* ./
#tar -xzvf 202_trim_test1_Assembled.tar.gz
tar -xzvf 202_trim_test2_Assembled.tar.gz

#python quast-4.6.1/quast.py 202_trim_test1_Assembled/final.contigs.fa -o 202_1_report
#tar -czf 202_1_report.tar.gz 202_1_report
#cp 202_1_report.tar.gz /mnt/gluster/tdberry

python quast-4.6.1/quast.py 202_trim_test2_Assembled/final.contigs.fa -o 202_2_report
tar -czf 202_2_report.tar.gz 202_2_report
cp 202_2_report.tar.gz /mnt/gluster/tdberry

rm *.tar.gz *.sh





