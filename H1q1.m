EL = 39e9; ET = 8.5e9; GLT = 4.5e9; nuLT = 0.28;
nuTL = nuLT*ET/EL;

S = [ 1/EL,      -nuLT/EL,    0;
     -nuTL/ET,    1/ET,       0;
      0,          0,          1/GLT ];

phi = 20*pi/180; c = cos(phi); s = sin(phi);

Tsig = [ c^2,   s^2,   2*c*s;
         s^2,   c^2,  -2*c*s;
        -c*s,   c*s,   c^2 - s^2 ];

Teps = [ c^2,   s^2,    c*s;
         s^2,   c^2,   -c*s;
        -2*c*s, 2*c*s,  c^2 - s^2 ];

Sxy = Teps * S / Tsig
Cxy = inv(Sxy)
