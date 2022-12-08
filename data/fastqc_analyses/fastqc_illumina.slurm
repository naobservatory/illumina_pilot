#!/bin/bash
#SBATCH -n 10 #Request 1 tasks (cores)
#SBATCH -t 12:00:00 #Request runtime of 12 hours (maximum run time)
#SBATCH -p sched_mit_hill #Run on sched_engaging_default partition
#SBATCH --mem-per-cpu=4000 #Request 4G of memory per CPU
#SBATCH -o /nobackup1/slgrimm/slurm/fastqc/output_fastqc%j.txt #redirect output to output_JOBID.txt
#SBATCH -e /nobackup1/slgrimm/slurm/fastqc/error_fastqc%j.txt #redirect errors to error_JOBID.txt
#SBATCH --mail-type=BEGIN,END #Mail when job starts and ends
#SBATCH --mail-user=slgrimm@mit.edu #email recipient


WORKDIR=$(pwd)
SEQUENCPATH=$WORKDIR/raw_sequences
REPORTPATH=$WORKDIR/fastqc_reports

#Load the module
module load fastqc/0.11.9

# Setting output directory and running FASTQC on all the files in the sequences directory
fastqc $SEQUENCPATH/*.fastq --outdir=$REPORTPATH


