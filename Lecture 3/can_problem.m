
clear; clc; close all;

V1_L = 0.33; %L
V2_L = 0.50; %L

V1_SI = V1_L/1000; %1000L/m^3
V2_SI = V2_L/1000; %1000L/m^3

r_axis = 0.01:0.0001:0.10;

[h1, S1] = cyl_from_r_and_V(r_axis,V1_SI);
[h2, S2] = cyl_from_r_and_V(r_axis,V2_SI);

[min_S1,min_idx_S1] = min(S1);
[min_S2,min_idx_S2] = min(S2);

rmin1 = r_axis(min_idx_S1)
rmin2 = r_axis(min_idx_S2)

figure(1);
hold on;
plot(r_axis,S1);
line([rmin1 rmin1],[0 max(S1)])
line([0,0.10],[min_S1,min_S1])
ylim([0 max(S1)]);

figure(2)
hold on;
plot(r_axis,S2);
line([rmin2 rmin2],[0 max(S2)])
line([0,0.10],[min_S2,min_S2])
ylim([0 max(S2)]);

d1_cm = 2*rmin1*100
d2_cm = 2*rmin2*100
h1_cm = h1(min_idx_S1)*100
h2_cm = h2(min_idx_S2)*100


