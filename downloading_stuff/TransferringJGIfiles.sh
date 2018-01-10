#!/bin/bash
#
# TransferringJGIfiles.sh
#
# This script is for getting large JGI files from the online repository
# Currently set up to take only the files and save those together as a .tar.gz file

# Establishing the connection with JGI and account login
curl 'https://signon.jgi.doe.gov/signon/create' --data-urlencode 'login=tdberry@wisc.edu' --data-urlencode 'password=5gwiabaoc!' -c cookies > /dev/null


#We will want to download every sample after it's gone through JGI QC, but not yet through assembly.

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_202_MG/download/_JAMO/58660c3d7ded5e78cff923a0/11201.7.196041.GCCAAT.filter-METAGENOME.fastq.gz' -b cookies > 202_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_247_MG/download/_JAMO/5866102f7ded5e78cff923c9/11202.8.196024.AGTCAA.filter-METAGENOME.fastq.gz' -b cookies > 247_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_242_MG/download/_JAMO/5866100d7ded5e78cff923c2/11202.7.196021.TAGCTT.filter-METAGENOME.fastq.gz' -b cookies > 242_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_237_MG/download/_JAMO/5866173f7ded5e78cff923d7/11202.6.196018.GATCAG.filter-METAGENOME.fastq.gz' -b cookies > 237_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_231_MG/download/_JAMO/586608f97ded5e78cff92387/11201.6.196038.ACAGTG.filter-METAGENOME.fastq.gz' -b cookies > 231_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_226_MG/download/_JAMO/586605347ded5e78cff9237a/11201.6.196038.TGACCA.filter-METAGENOME.fastq.gz' -b cookies > 226_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_217_MG/download/_JAMO/58660c997ded5e78cff923b0/11202.6.196018.ACTTGA.filter-METAGENOME.fastq.gz' -b cookies > 217_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_216_MG/download/_JAMO/5866050b7ded5e78cff92371/11201.5.196035.CGATGT.filter-METAGENOME.fastq.gz' -b cookies > 216_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_207_MG/download/_JAMO/586602077ded5e78cff9235d/11201.7.196041.CAGATC.filter-METAGENOME.fastq.gz' -b cookies > 207_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_221_MG/download/_JAMO/58660bf47ded5e78cff92398/11201.5.196035.TTAGGC.filter-METAGENOME.fastq.gz' -b cookies > 221_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_243_MG/download/_JAMO/58660cd67ded5e78cff923b9/11202.7.196021.GGCTAC.filter-METAGENOME.fastq.gz' -b cookies > 243_MG_QC.fastq.gz

curl 'https://genome.jgi.doe.gov/ext-api/downloads/get_tape_file?blocking=true&url=/Whisoiple_246_MG/download/_JAMO/586619dd7ded5e78cff923df/11202.8.196024.CTTGTA.filter-METAGENOME.fastq.gz' -b cookies > 246_MG_QC.fastq.gz

# That should have all of them downloaded.


#For file transfer simplicity, we probably want to actually zip them into a larger tarball.

tar -czf JGI_metagenomes.tar.gz *.fastq.gz

# Then, because it is so giant, we will transfer it to Gluster. You’d change this to wherever you are storing large files.
cp JGI_metagenomes.tar.gz  /mnt/gluster/tdberry

# Remove the original and combined files from here so it's not transferred back - will be giant.
rm *.gz

# Don't need cookies file either.
rm cookies

