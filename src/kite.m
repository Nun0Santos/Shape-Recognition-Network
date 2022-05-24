function kite(numberPixels)

%   23/05/2022  Nuno Santos : a2019110035@isec.pt
%   23/05/2022  Rafael Gil : a2020136741@isec.pt
clc;
clear all;
close all;

totalNumberPixels = power((224*224), 2) * 3;
 
in = zeros(5 * 6, 224*224);
target = zeros(1, 5 * 6);

for i = 0 : 5
    for j = 0 : 5-1 
        [rgb, ~] = imresize(imread(sprintf("../start/kite/%d.png", i)));
         bw = imbinarize(rgb);
         in(i * (5) + j + 1, :) = bw(:)';
         target(i * (5) + j + 1) = i + 1;
     end
  end
  in = in';
end

