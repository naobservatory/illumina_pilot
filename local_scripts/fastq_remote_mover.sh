#!/bin/bash

#Quickly put-together bash script to move all fastq files into one common folder

cd ..
WORKDIR=$(pwd)
SEQUENCES=$WORKDIR/raw_fastqs
REMOTE=slgrimm@eofe8.mit.edu:/nobackup1c/users/slgrimm/illumina_pilot/fastqc_analyses

#take all files with .fastq extension and copy them to the new location

for FILE in $SEQUENCES
do
    echo "Copying $FILE to $REMOTE"
    rsync -avr -e ssh $SEQUENCES $REMOTE
done