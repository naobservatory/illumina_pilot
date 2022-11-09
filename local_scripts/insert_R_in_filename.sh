#!/bin/bash

#For all files in the current directory, insert an "R" after "_" in the filename
{
    for FILE in *;
    do
        echo "Renaming $FILE to $(echo $FILE | sed 's/_/_R/')"
        mv $FILE $(echo $FILE | sed 's/_/_R/')
    done
} > rename_log.txt
