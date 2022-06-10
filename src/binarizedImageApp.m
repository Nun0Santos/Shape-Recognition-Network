function [in] =  binarizedImageApp(imgPath)

IMG_RES = [25 25]; % de 224x224 passa a 30x30
%% Ler e redimensionar as imagens e preparar os targets

binaryMatrix = zeros(IMG_RES(1) * IMG_RES(2), 1);
targetMatrix = [];

img = imread(sprintf(imgPath));
img=rgb2gray(img);
img = imresize(img, IMG_RES);
binarizedImg = imbinarize(img);
binaryMatrix(:, 1) = reshape(binarizedImg, 1, []);

in = binaryMatrix;
end