function [output] = loadNetwork(netName,folder)

load(netName, "net"); 

if(strcmpi(folder,'start'))
   [in, target] = binarizedStartData();
end

if(strcmpi(folder, 'test'))
    [in, target] = binarizedTestData();
end

if(strcmpi(folder, 'train'))
    [in, target] = binarizedTrainData();
end    

out = sim(net, in);

r=0;
for i=1:size(out,2)               
    [a, b] = max(out(:,i));      
    [c, d] = max(target(:,i)); 
    if b == d                      
      r = r+1;
    end
end

accuracy = r/size(out,2);

output = accuracy*100;

end