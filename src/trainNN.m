function trainNN()
%Neural network to recognize several geometrical shapes

clc;

%%Image processing
IMG_RES = [25 25];


for i=1:5
    img = imread(sprintf('\\start\\circle-start-%d.png', i));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    circle = reshape(binarizedImg, 1, []);
end

circleTarget = [eye(10)];

%%Train network
net = feedforwardnet([10]);

net.trainFcn = 'trainlm';
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin';
net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0;

[net,tr] = train(net, circle, circleTarget);

%%Simulate and analyse the results


out = sim(net, letrasBW)

disp(tr);

r = 0;
for i=1:size(out,2)
    [a b] = max(out(:,i));
    [c d] = max(letrasTarget(:,i));
    if b == d
      r = r+1;
    end
end

accuracy = r/size(out,2);
fprintf('Precisao total de treino %f\n', accuracy)

end