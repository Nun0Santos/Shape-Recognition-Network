function [output] = loadNetworkSingleImage(netName,imgPath, inMatrix)

load(netName, "net");

in = binarizedImageApp(imgPath, inMatrix);

out = sim(net, in);

[a, b] = max(out);

switch(b)
    case 1
        %fprintf("circle\n")
        output = "circle";
    case 2
        %fprintf("kite\n")
        output = "kite";
    case 3
        %fprintf("parallelogram\n")
        output = "parallelogram";
    case 4
        %fprintf("square\n")
        output = "square";
    case 5
        %fprintf("trapezoid\n")
        output = "trapezoid";
    case 6
        %fprintf("triangle\n")
        output = "triangle";
    otherwise
        %fprintf("Could not recognize")
        output = "Could not recognize";
end
end