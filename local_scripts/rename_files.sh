#!/usr/bin/env bash

#Rename files to end with _full_taxonomy.txt instead of_kraken2_report_full_taxonomy

for file in *.txt; do
    mv "$file" "${file%_kraken2_report_full_taxonomy.txt}_full_taxonomy.txt"
done