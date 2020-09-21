
clear;clc;close all;

V = 0.33/1000;

Sfun = @(r) 2*pi*r*((V/(pi*r^2))+r);

Sfun(0.0374)

x0 = 0.01;
A = 1;
b = 1;

fminsearch(Sfun,x0)


