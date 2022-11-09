#!/bin/bash
cd ..
WORKDIR=$(pwd)
SEQUENCES=$WORKDIR/sequences
METADATA=$WORKDIR/metadata/*.csv

czid short-read-mngs upload-samples \
  -p '11_09_2022_nao_exp_4_005' \
  --metadata-csv $METADATA \
  $SEQUENCES

