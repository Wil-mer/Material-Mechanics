clear all
clc
% Parameters
w = 1000;       %rad/s
E = 200e9;      %Pa
n = 2;
sigc7 = 200e6; %Pa stress that corresponds to 1e-8 h*e-1 creep rate
rho = 5000;     % kg/m^3
l = 0.5;        %m
ra = 0.1;       %m
rb = ra + l;
sigr = @(r) 0.5*rho*w^2*(rb^2-r.^2);
h = 60*60; % s
tau = 1e7 * h;


t0 = 5e5 * 3600; % sec

eps_c = @(r,t) 1/tau * (sigr(r)./sigc7).^n * t;
eps_E = @(r) sigr(r)/E;
dLE = integral(eps_E,ra,rb)
eps = @(r,t) eps_c(r,t) + eps_E(r);

dL = @(t) 1000 * integral(@(r) eps(r,t), ra, rb) - 4;  % mm

t_4mm = secant(t0,dL);
fprintf("4 mm total elongation at %0.0f seconds, or %0.2f hours", t_4mm, t_4mm/3600)
