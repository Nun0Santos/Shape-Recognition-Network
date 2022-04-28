function trainNN()
%Neural network to recognize several geometrical shapes

clc;

%%Image processing
IMG_RES = [25 25];


for i=0:4
    img = imread(sprintf('start/circle/circle-start-%d.png', i));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    circle = reshape(binarizedImg, 1, []);
end

for i=0:4
    img = imread(sprintf('start/triangle/triangle-start-%d.png', i));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    triangle = reshape(binarizedImg, 1, []);
end

for i=0:4
    img = imread(sprintf('start/trapezoid/trapezoid-start-%d.png', i));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    trapezoid = reshape(binarizedImg, 1, []);
end

for i=0:4
    img = imread(sprintf('start/square/square-start-%d.png', i));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    square = reshape(binarizedImg, 1, []);
end

for i=0:4
    img = imread(sprintf('start/parallelogram/parallelogram-start-%d.png', i));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    parallelogram = reshape(binarizedImg, 1, []);
end

for i=0:4
    img = imread(sprintf('start/kite/kite-start-%d.png', i));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    kite = reshape(binarizedImg, 1, []);
end

circleTarget = [eye(10)];
triangleTarget = [eye(10)];
trapezoidTarget = [eye(10)];
squareTarget = [eye(10)];
parallelogramTarget = [eye(10)];
kitegramTarget = [eye(10)];

%%Train network
net = feedforwardnet([10]);

net.trainFcn = 'trainlm';
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin';
net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0;

[net,tr] = train(net, );

%%Simulate and analyse the results

end