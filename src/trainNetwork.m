function trainNetwork(train,transfer1,transfer2,divide,trainRatio,valRatio,testRatio,folder,netName)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% Preparar e treinar rede

clc;

%xInput = input('Which folder do you want to open? ', 's');

net = feedforwardnet((10));

net.trainFcn = train;
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

save(netName, 'net');

%% Simular e analisar resultados

out = sim(net, in);

disp(tr);

r = 0;
for i=1:size(out,2)
    [a b] = max(out(:,i));
    [c d] = max(target(:,i));
    if b == d
      r = r+1;
    end
end
accuracy = r/size(out,2);
fprintf('Precisão total de treino %f\n', accuracy)

end