function trainNetwork
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% Preparar e treinar rede

net = feedforwardnet([10]);

net.trainFcn = 'trainlm';
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin';
net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0;

[in, target] = binarizedStartData();

[net,tr] = train(net, in, target);

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