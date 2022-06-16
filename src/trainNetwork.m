function [output] = trainNetwork(trainParam, transfer1,transfer2,divide,trainRatio,valRatio,testRatio,folder,netName)

net = feedforwardnet([10]);
net.trainFcn = trainParam;
net.layers{1}.transferFcn = transfer1;
net.layers{2}.transferFcn = transfer2;
net.divideFcn = divide;
net.divideParam.trainRatio = trainRatio;
net.divideParam.valRatio = valRatio;
net.divideParam.testRatio = testRatio;

if(strcmpi(folder,'start'))
   [in, target] = binarizedStartData();
end

if(strcmpi(folder, 'test'))
    [in, target] = binarizedTestData();
end

if(strcmpi(folder, 'train'))
    [in, target] = binarizedTrainData();
end    

[net,tr] = train(net, in, target);


str = strcat("..\\networks\\", netName);
save(str, 'net');

%% Simular e analisar resultados

out = sim(net, in);

r = 0;
for i=1:size(out,2)
    [a, b] = max(out(:,i));
    [c, d] = max(target(:,i));
    if b == d
      r = r+1;
    end
end
plotconfusion(target,out)
accuracy = r/size(out,2);
output = accuracy*100;
%fprintf('Precisão total de treino %f\n', accuracy);

end