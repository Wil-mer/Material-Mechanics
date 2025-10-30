sig_exp = 300e9; %Pa
tau_exp = 173e9; %Pa
q_1=1.5; q_2=1; q_3=2.25; % using classic Tvergaard

F = @(x) [(sqrt(3)*tau_exp/x(1))^2 + 2*q_1*x(2) - (1 + q_3*x(2)^2);
          (sig_exp/x(1))^2 + 2*q_1*x(2)*cosh(q_2*sig_exp/(2*x(1))) - (1 + q_3*x(2)^2)];

x0 = [sqrt(3)*tau_exp; 0.01];  % initial guess
x = fsolve(F,x0);
sig_s = x(1)
nu_f = x(2)