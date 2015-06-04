function mytestspmd(n)

c = Composite();

spmd

temp = labindex*ones(10);
for u=1:10
	c = temp * temp;
end

end

d=[c{:}];
fileout = strcat('test',num2str(n),'.mat');
save(fileout,'d');

end

