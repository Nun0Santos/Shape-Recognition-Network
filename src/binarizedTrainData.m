function [in, target] =  binarizedTrainData()

IMG_RES = [28 28]; % de 224x224 passa a 30x30

DataPath = ["circle","kite","parallelogram","square","trapezoid","triangle"];
%% Ler e redimensionar as imagens e preparar os targets

binaryMatrix = zeros(IMG_RES(1) * IMG_RES(2), 50);
targetMatrix = [];
count = 1;

for i=1:6
    for j=1:50
    img = imread(sprintf('..\\train\\%s\\%d.png', DataPath(i), j));
    img = rgb2gray(img);
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    binaryMatrix(:, count) = reshape(binarizedImg, 1, []);
    targetMatrix(count) = i;
    count = count +1;
    end
end

vec1 = repelem(1, 50);
vec2 = repelem(2, 50);
vec3 = repelem(3, 50);
vec4 = repelem(4, 50);
vec5 = repelem(5, 50);
vec6 = repelem(6, 50);
targetMatrix = [vec1, vec2, vec3, vec4, vec5, vec6];

target = onehotencode(targetMatrix,1,'ClassNames',1:6);
in = binaryMatrix;
end