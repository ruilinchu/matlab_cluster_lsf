# matlab_cluster_lsf
put these scripts in ~/matlab/ and follow the examples to submit parallel or batch matlab jobs from LSF.

A simple work through is like this:  first, you need to do the following:

download this repo and rename it as ~/matlab

and now you can start up an interactive sssion by

$ bsub -q interactive -Is bash

and now start a matlab client

$ matlab -nodisplay

now in matlab you can do

> c = getCluster('10:00','priority')

and you now have a handel to the orchestra cluster with 10 hour walltime and in the priority queue

and now you can start a parpool by

> c.parpool(4)

wait till LSF gets you the allocation, and now you can do parfor loops as before, after you finish calculation you can close the pool by

> delete(gcp)

and that's it. For more complicated examples, plz check out the parallel_exmaple.m sample files in ~/matlab 

Jimi Chu, HMS RC
