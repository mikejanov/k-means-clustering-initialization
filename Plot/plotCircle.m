% Michael Janov
% November 30, 2017
% plotCircle.m
% From https://www.mathworks.com/help/matlab/ref/plot.html

function plotCircle(r, mean)
    theta = linspace(0,2*pi);
    x = r*cos(theta) + mean(1);
    y = r*sin(theta) + mean(2);
    plot(x,y);
end