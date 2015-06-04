c = getCluster('01:00','mpi');

% usage: cluster = getCluster('walltime','queue-name'); 
% here asking for 1 hour and priority queue
% ask for only 1 client in the bsub script with '-n 1' option and ask 
% for number of workers here, sending out 3 mpi jobs and each asking for 8 core here

%j = c.batch('mytestspmd','pool',8) %use this when mytestspmd is just a script

j1 = c.batch(@mytestspmd, 0 ,{2}, 'pool', 8) % when mytestspmd is a function with input int
j2 = c.batch(@mytestspmd, 0 ,{3}, 'pool', 8) % when mytestspmd is a function with input int
j3 = c.batch(@mytestspmd, 0 ,{4}, 'pool', 8) % when mytestspmd is a function with input int

% in total 3 mpi jobs are sent out in the mpi queue

j1.wait
j2.wait
j3.wait




