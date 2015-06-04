c = getCluster('01:00','priority');

% usage: cluster = getCluster('walltime','queue-name'); 
% here asking for 1 hour and priority queue
% ask for only 1 client in the bsub script with '-n 1' option and ask 
% for number of workers here, asking for 8 here
% after the parpool command a mpi job will start

c.parpool(8)

c = Composite();
spmd
temp = labindex*ones(10);
for u=1:10
  c = temp * temp;
end
end
d=[c{:}];
save('test.mat','d');

delete(gcp)



