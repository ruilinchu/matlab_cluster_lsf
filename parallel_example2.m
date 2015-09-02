c = parcluster;
c.SubmitArguments='-W 01:00 -q short';

% here asking for 1 hour and short queue
% ask for only 1 client in the bsub script with '-n 1' option
% here submitting a job array containing 3 indenpent jobs

j = c.createJob;

a = rand(4);

j.createTask(@sin, 1, {a});
j.createTask(@cos, 1, {a});
j.createTask(@exp, 1, {a});

% in toal three independent jobs are sent to short queue using 1 core
j.submit;
j.wait;

result = j.fetchOutputs;
f = [result{:}];
save('example4.mat','f');
