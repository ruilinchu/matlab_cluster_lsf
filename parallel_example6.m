c=parallel.cluster.LSF();
evalc('system(''mkdir -p ~/MATLAB_JOB_STORAGE'')');
c.JobStorageLocation='~/MATLAB_JOB_STORAGE';
c.SubmitArguments='-W 00:02 -q mpi';

c.parpool(22)

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
 system('hostname');
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
