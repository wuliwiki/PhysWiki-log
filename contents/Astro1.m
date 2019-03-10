% data of the solar system

close all; clear;

R_sun =  6.96e5; % km

R_earth = 6.37e3; % km
r_earth = 1.46e8; % km

R_moon = 1.74e3; % km
r_moon = 3.84e5; % km

R_jupiter = 7.15e4; % km
r_jupiter = 7.79e8; % km

r_neptune = 4.5e9; % km

r_alpha = 3.99e13; % km


phi = linspace(0,2*pi,200);
x_c = cos(phi);
y_c = sin(phi);



figure; hold on; axis equal;
plot(R_sun*x_c, R_sun*y_c);
plot(R_earth*(x_c + 10000), R_earth*y_c);
