% Michael Barile 
% name = (13 + 2)/100
% This file uses equation 4 to find Re, then uses equations...
% 1 and 2 to find V and D, and finally uses equation 3 as the error.

clear all
close all
clc

df = 0.0001;
f1_min = 0.0001;
f1_max = 1;

err0 = 10.01000;

f1 = f1_min:df:f1_max;

for i = 1:length(f1)
    re(i) = 2.51*10^(1/(2*sqrt(f1(i))))/sqrt(f1(i));
    v(i) = (100*pi/60)*(.00001655*re(i))^2;
    d(i) = sqrt(.6/(pi*v(i)));
    err(i) =  f1(i)*150*(v(i))^2/(d(i)*2*9.81) - 20;
    if abs(err(i)) <= err0
        err0 = abs(err(i));
    end
end

plot(f1,err)
axis([0 .05 -25 25])
grid





