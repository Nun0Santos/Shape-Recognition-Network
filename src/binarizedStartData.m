function [in, target] =  binarizedStartData()

IMG_RES = [28 28]; % de 224x224 passa a 30x30

DataPath = ["circle","kite","parallelogram","square","trapezoid","triangle"];
%% Ler e redimensionar as imagens e preparar os targets

binaryMatrix = zeros(IMG_RES(1) * IMG_RES(2), 5);
count = 1;
targetMatrix = [];
for i=1:6
    for j=1:5
        img = imread(sprintf('..\\start\\%s\\%d.png', DataPath(i), j));
        img = rgb2gray(img);
        img = imresize(img, IMG_RES);
        binarizedImg = imbinarize(img);
        binaryMatrix(:, count) = reshape(binarizedImg, 1, []);
        targetMatrix(count)=i;
        count = count + 1;
        target(count)=i;
        count=count+1;
        Stashed changes
    end
end
in = binaryMatrix;
target = targetMatrix;
end