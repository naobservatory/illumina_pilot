#!/bin/bash

#Quickly put-together bash script to edit all fastq file endings from *1_sequence.fastq to *_R1.fastq or *2_sequence.fastq to *_R2.fastq

cd ..
WORKDIR=$(pwd)
SEQUENCES=$WORKDIR/sequences
LOGS=$WORKDIR/logs

{
    for DIR in $SEQUENCES/*;

    do
        echo "found $DIR";
        for FILE in $DIR/*;
        do

            if [[ $FILE == *.fastq ]];
            then
                echo "$FILE was recognized as a .fastq file"
                echo "Renaming $DIR/$FILE to $(echo $DIR/$FILE | sed 's/1_sequence.fastq/R1.fastq/')"
                mv $FILE $(echo $DIR/$FILE | sed 's/1_sequence.fastq/R1.fastq/')
                echo "Renaming $DIR/$FILE to $(echo $DIR/$FILE | sed 's/2_sequence.fastq/R2.fastq/')"
                mv $FILE $(echo $DIR/$FILE | sed 's/2_sequence.fastq/R2.fastq/')
            fi
        done
    done
} > $LOGS/insert_R_in_filename.txt

