function [in, target] =  binarizedStartData()

IMG_RES = [25 25]; % de 224x224 passa a 30x30

DataPath = ["circle","kite","parallelogram","square","trapezoid","triangle"];
%% Ler e redimensionar as imagens e preparar os targets

binaryMatrix = zeros(IMG_RES(1) * IMG_RES(2), 5);
targetMatrix = [];
count = 1;

for i=1:6
    for j=1:5
         img = imread(sprintf('..\\start\\%s\\%d.png', DataPath(i), j));
        img = rgb2gray(img);
        img = imresize(img, IMG_RES);
        binarizedImg = imbinarize(img);
        binaryMatrix(:, count) = reshape(binarizedImg, 1, []);
        count=count+1;
    end
    %count = 1;
end

vec1 = repelem(1, 5);
vec2 = repelem(2, 5);
vec3 = repelem(3, 5);
vec4 = repelem(4, 5);
vec5 = repelem(5, 5);
vec6 = repelem(6, 5);
targetMatrix = [vec1, vec2, vec3, vec4, vec5, vec6];


target = onehotencode(targetMatrix,1,'ClassNames',1:6);
in = binaryMatrix;save("in.mat", "in");
%target = targetMatrix;
end