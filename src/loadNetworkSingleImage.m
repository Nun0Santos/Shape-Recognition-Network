function loadNetworkSingleImage(netName,imgPath)

load(netName, "net");

in = binarizedImageApp(imgPath);

out = sim(net, in);
%size(out)

%disp(out)


[a, b] = max(out);
disp(b)

switch(b)
    case 1
        fprintf("circle")
    case 2
        fprintf("kite")
    case 3
        fprintf("parallelogram")
    case 4
        fprintf("square")
    case 5
        fprintf("trapezoid")
    case 6
        fprintf("triangle")
    otherwise
        fprintf("ola")
end
end