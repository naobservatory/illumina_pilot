#!/bin/bash
cd ..
WORKDIR=$(pwd)
SEQUENCES=$WORKDIR/sequences
METADATA=$WORKDIR/metadata

czid short-read-mngs upload-samples \
  -p '11_09_2022_nao_exp_4_0005' \
  --metadata-csv $METADATA \
  $SEQUENCES

