c = parcluster;
c.SubmitArguments='-W 01:00 -q mpi';

% here asking for 1 hour and mpi queue
% ask for only 1 client in the bsub script with '-n 1' option and ask 
% for number of workers here, asking for 8 here

c.parpool(8)

spmd
switch labindex 
 case 1
  A = 1:5;
  labSend(A,2,199);
 case 2
  A = labReceive(1,199);
 otherwise
  A = 11:15;
 end
end

A{:}

spmd
if labindex == 1
  A=labBroadcast(1,1:5);
 else
  A=labBroadcast(1);
end
end

A{:}

delete(gcp)
