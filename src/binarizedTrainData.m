function [in, target] =  binarizedTrainData()

IMG_RES = [28 28]; % de 224x224 passa a 30x30

DataPath = ["circle","kite","parallelogram","square","trapezoid","triangle"];
%% Ler e redimensionar as imagens e preparar os targets

binaryMatrix = zeros(IMG_RES(1) * IMG_RES(2) * 3, 50);

for i=1:6
    for j=1:50
    img = imread(sprintf('..\\train\\%s\\%d.png', DataPath(i), j));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    binaryMatrix(:, j) = reshape(binarizedImg, 1, []);
    end
end
targetMatrix = [eye(50)];
in = binaryMatrix;
target = targetMatrix;
end