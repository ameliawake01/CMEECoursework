#!/bin/bash
#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=1:mem=1gb
cp $HOME/aw3021_HPC_2021_main.R .
module load anaconda3/personal
echo "R is about to run"
R --vanilla < $HOME/cluster_run.R
mv cluster_run_output* $HOME
echo "R has finished running"
#endoffile