
clear; clc; close all;

x0 = 0; y0 = 0; % Initial position
x1 = 20; y1 = -30; % Final position

v1 = 7; v2 = 4; % velocity in m/s

%f1 = @(x) -10+0*x; % Sea line funktion
f1 = @(x) -0.5*x-10;

d1 = @(x) sqrt((abs(x0-x)).^2+(abs(y0-f1(x))).^2);
d2 = @(x) sqrt((abs(x-x1)).^2+(abs(f1(x)-y1)).^2);

T = @(x) d1(x)/v1+d2(x)/v2;

x_axis = 0:0.1:25;

figure(1);
plot(x_axis,T(x_axis));

x_opt = fminsearch(T,0);
x_opt2 = fminsearch(T,x_opt*2);


figure(2);
title('Optimal line');
plot(x_axis,f1(x_axis));
line([x0 x_opt],[y0 f1(x_opt)]);
line([x_opt x1],[f1(x_opt) y1]);