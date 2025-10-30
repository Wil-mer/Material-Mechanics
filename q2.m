sigma_s = 300e6;

% Sigma grid
Ns = 1000;
sigma = linspace(-sigma_s, sigma_s, Ns);

% Tresca
tau_t_pos = 0.5 * sqrt(max(0, sigma_s^2 - sigma.^2));
tau_t_neg = -tau_t_pos;

% von Mises
tau_vm_pos = (1/sqrt(3)) * sqrt(max(0, sigma_s^2 - sigma.^2));
tau_vm_neg = -tau_vm_pos;

figure; hold on; box on; grid on
plot(sigma/1e6, tau_t_pos/1e6, 'LineWidth', 1.8)   % Tresca +
plot(sigma/1e6, tau_t_neg/1e6, 'LineWidth', 1.8)   % Tresca -
plot(sigma/1e6, tau_vm_pos/1e6, 'LineWidth', 1.8)  % von Mises +
plot(sigma/1e6, tau_vm_neg/1e6, 'LineWidth', 1.8)  % von Mises -
plot(0, (sigma_s/2)/1e6, '*','MarkerFaceColor','k');              % Tresca torsion
plot(0, (sigma_s/sqrt(3))/1e6, '*','MarkerFaceColor','k');        % v.Mises torsion

xlabel('sigma  [MPa]')
ylabel('tau  [MPa]')
legend('Tresca','Tresca','von Mises','von Mises')
title('Yield loci in the sigma, tau plane')
axis equal
xlim([-1.1 1.1]*sigma_s/1e6)
ylim([-0.65 0.65]*sigma_s/1e6)