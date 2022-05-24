function [in, target] =  binarizedStartData()

IMG_RES = [28 28]; % de 224x224 passa a 30x30

DataPath = ["circle","kite","parallelogram","square","trapezoid","triangle"];
%% Ler e redimensionar as imagens e preparar os targets

letrasBW = zeros(IMG_RES(1) * IMG_RES(2) * 3, 5);

for i=1:6
    for j=1:5
    img = imread(sprintf('..\\start\\%s\\%d.png', DataPath(i), j));
    img = imresize(img, IMG_RES);
    binarizedImg = imbinarize(img);
    letrasBW(:, j) = reshape(binarizedImg, 1, []);
    end
end
letrasTarget = [eye(5)];
in = letrasBW;
target = letrasTarget;
end