function [in, target] =  binarizedTestData()

IMG_RES = [28 28]; % de 224x224 passa a 30x30

DataPath = ["circle","kite","parallelogram","square","trapezoid","triangle"];
%% Ler e redimensionar as imagens e preparar os targets

binaryMatrix = zeros(IMG_RES(1) * IMG_RES(2), 10);
targetMatrix = [];
count = 1;

for i=1:6
    for j=1:10
    img = imread(sprintf('..\\test\\%s\\%d.png', DataPath(i), j));
    img = rgb2gray(img);
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    binaryMatrix(:, count) = reshape(binarizedImg, 1, []);
    targetMatrix(count) = i;
    count = count + 1;
    end
    count = 1;
end

% vec1 = repelem(1, 10);
% vec2 = repelem(2, 10);
% vec3 = repelem(3, 10);
% vec4 = repelem(4, 10);
% vec5 = repelem(5, 10);
% vec6 = repelem(6, 10);
% targetMatrix = [vec1, vec2, vec3, vec4, vec5, vec6];
% 
% target = onehotencode(targetMatrix,1,'ClassNames',1:6);
in = binaryMatrix;
target = targetMatrix;
end