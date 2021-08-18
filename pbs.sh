#!/bin/bash

#PBS -N hello
#PBS -q fisica_high
#PBS -l nodes=8:ppn=48
#PBS -j oe
#PBS -o output
#PBS -l walltime=3:00
cd $PBS_O_WORKDIR


mpiexec ./hello
