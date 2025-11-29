clear all; clc

EL = 39e9; ET = 8.5e9; GLT = 4.5e9;
nuLT = 0.28; nuTL = nuLT * ET/EL;
sigX = 100e6; sigY = 50e6; tauXY = 75e6;

C11 = EL/(1-nuLT*nuTL); C12 = (nuLT*ET)/(1-nuLT*nuTL); C22 = ET/(1-nuLT*nuTL); C66 = GLT;

C = [C11 C12 0; C12 C22 0; 0 0 C66];

phi1 = 0;
phi2 = 45;
phi3 = -45;

Tsig1 = [cosd(phi1)^2  sind(phi1)^2 2*sind(phi1)*cosd(phi1);
        sind(phi1)^2 cosd(phi1)^2 -2*sind(phi1)*cosd(phi1);
        -sind(phi1)*cosd(phi1) sind(phi1)*cosd(phi1) cosd(phi1)^2-sind(phi1)^2];

Tsig2 = [cosd(phi2)^2  sind(phi2)^2 2*sind(phi2)*cosd(phi2);
        sind(phi2)^2 cosd(phi2)^2 -2*sind(phi2)*cosd(phi2);
        -sind(phi2)*cosd(phi2) sind(phi2)*cosd(phi2) cosd(phi2)^2-sind(phi2)^2];

Tsig3 = [cosd(phi3)^2  sind(phi3)^2 2*sind(phi3)*cosd(phi3);
        sind(phi3)^2 cosd(phi3)^2 -2*sind(phi3)*cosd(phi3);
        -sind(phi3)*cosd(phi3) sind(phi3)*cosd(phi3) cosd(phi3)^2-sind(phi3)^2];

Teps1 = [cosd(phi1)^2  sind(phi1)^2 sind(phi1)*cosd(phi1);
        sind(phi1)^2 cosd(phi1)^2 -sind(phi1)*cosd(phi1);
        -2*sind(phi1)*cosd(phi1) 2*sind(phi1)*cosd(phi1) cosd(phi1)^2-sind(phi1)^2];
Teps2 = [cosd(phi2)^2  sind(phi2)^2 sind(phi2)*cosd(phi2);
        sind(phi2)^2 cosd(phi2)^2 -sind(phi2)*cosd(phi2);
        -2*sind(phi2)*cosd(phi2) 2*sind(phi2)*cosd(phi2) cosd(phi2)^2-sind(phi2)^2];
Teps3 = [cosd(phi3)^2  sind(phi3)^2 sind(phi3)*cosd(phi3);
        sind(phi3)^2 cosd(phi3)^2 -sind(phi3)*cosd(phi3);
        -2*sind(phi3)*cosd(phi3) 2*sind(phi3)*cosd(phi3) cosd(phi3)^2-sind(phi3)^2];


C1 = inv(Tsig1) * C * Teps1;
C2 = inv(Tsig2) * C * Teps2;
C3 = inv(Tsig3) * C * Teps3;

A = (C1 + C2 + C3 + C3 + C2 + C1)/6;

sigma = [sigX; sigY; tauXY];
eps   = A \ sigma