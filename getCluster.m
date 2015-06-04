function cluster = getCluster(wtime, queue)
  % input format:
  % wtime='10:00';
  % queue='priority';

evalc('system(''mkdir -p ~/MATLAB_JOB_STORAGE'')');
cluster = parallel.cluster.Generic('JobStorageLocation', '~/MATLAB_JOB_STORAGE');
set(cluster, 'HasSharedFilesystem', true);
set(cluster, 'ClusterMatlabRoot', '/opt/matlab-2015a');
set(cluster, 'OperatingSystem', 'unix');

set(cluster, 'IndependentSubmitFcn', {@independentSubmitFcn, wtime, queue});
set(cluster, 'CommunicatingSubmitFcn', {@communicatingSubmitFcn, wtime, queue});
set(cluster, 'GetJobStateFcn', @getJobStateFcn);
set(cluster, 'DeleteJobFcn', @deleteJobFcn);

end

