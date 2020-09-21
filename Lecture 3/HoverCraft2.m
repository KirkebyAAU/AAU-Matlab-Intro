
clear; clc; close all;

x0 = 0; y0 = 0; % Initial position
x1 = 20; y1 = -30; % Final position

v1 = 7; v2 = 2; v3 = 4; % velocity in m/s

%f1 = @(x) -10+0*x; % Sea line funktion
f1 = @(x) -0.5*x-8;
f2 = @(x) -0.75*x-10;

d1 = @(xa) sqrt((abs(x0-xa)).^2+(abs(y0-f1(xa))).^2);
d2 = @(xa,xb) sqrt((abs(xa-xb)).^2+(abs(f1(xa)-f2(xb))).^2);
d3 = @(xb) sqrt((abs(xb-x1)).^2+(abs(f2(xb)-y1)).^2);

T = @(xa,xb) d1(xa)/v1+d2(xa,xb)/v2+d3(xb)/v3;

xa_axis = 0:0.1:25;
xb_axis = xa_axis';

T_points = T(xa_axis,xb_axis);
[xa_min_idx,xb_min_idx]=find(T_points==min(T_points(:))); % searching for optimal x, y for minimum z
xa_min = xa_axis(xa_min_idx);
xb_min = xb_axis(xb_min_idx);

min_T = min(T_points(:));

figure(1);
hold on;
mesh(xa_axis,xb_axis,T(xa_axis,xb_axis));
%plot3([0 xa_min],[0 xb_min],[0 min(T_points(:))],'markersize',50);
plot3(xa_min, xb_min, min(T_points(:)),'x','markersize',5);

figure(2);
hold on;
title('Optimal line');
plot(xa_axis,f1(xa_axis));
plot(xa_axis,f2(xa_axis));
line([x0 xa_min],[y0 f1(xa_min)]);
line([xa_min xb_min],[f1(xa_min) f2(xb_min)]);
line([xb_min x1],[f2(xb_min) y1]);
