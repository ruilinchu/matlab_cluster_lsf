#!/bin/bash
#
#BSUB -J para_matlab
#BSUB -W 10:00 ## walltime, ask for as long as you can for the matlab client
#BSUB -n 1 ## only ask for one matlab client here, ask for more mpi workers in the matlab script
#BSUB -q priority
#BSUB -e errors.%J
#BSUB -o output.%J

matlab -nodisplay -r "parallel_example4"
##matlab -nodisplay -r "parallel_example3"



