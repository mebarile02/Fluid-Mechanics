% Michael Barile
% name = (13 + 2)/100
% This file substitutes equation 1 into equation 3 to D for a given f,
% then uses equation 1 to find V, 2 to find Re, and finally uses equation
% 4 for the error.  

clear all
close all
clc

df = 0.0001;
f1_min = 0.0001;
f1_max = 1;

err0 = 10.01000;

f1 = f1_min:df:f1_max;

for i = 1:length(f1)
    d(i) = ((2.7/(pi^2*19.62))*f1(i))^(1/5);
    v(i) = .15/(pi*d(i)^2/4);
    re(i) = (v(i)*d(i))/.00001655;
    err(i) = 1/sqrt(f1(i)) + 2.0*log10(2.51/(re(i)*sqrt(f1(i))));
    if abs(err(i)) <= err0
        err0 = abs(err(i));
    end
end

plot(f1,err)
%axis([0 1 -25 25])
grid


