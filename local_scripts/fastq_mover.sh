#!/bin/bash

#Quickly put-together bash script to move all fastq files into one common folder

cd ..
WORKDIR=$(pwd)
SEQUENCES=$WORKDIR/sequences
NEWLOCATION=$WORKDIR/fastq_only

#take all files with .fastq extension and copy them to the new location

for FILE in $SEQUENCES/*/*.fastq;
do
    echo "Copying $FILE to $NEWLOCATION"
    cp $FILE $NEWLOCATION
done