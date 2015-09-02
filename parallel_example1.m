%% first time run this part, next time no need
c=parallel.cluster.LSF();
evalc('system(''mkdir -p ~/MATLAB_JOB_STORAGE'')');
c.JobStorageLocation='~/MATLAB_JOB_STORAGE';
saveAsProfile(c,'orchestra')
parallel.defaultClusterProfile('orchestra')

%% next time start from here
c=parcluster;

c.SubmitArguments='-W 00:20 -q mpi';

c.parpool(4)

parfor n=1:16
  a=getenv('HOSTNAME');
  x=['this is num ',num2str(n),' from host ', a];
  disp(x);
end

delete(gcp)
