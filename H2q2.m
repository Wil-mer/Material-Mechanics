clear all; clc
as = [1, 1, 1, 5, 0.2];
bs = [10, 1, 0.1, 1, 1];
Ee = 500e6;
sigma0 = 10e6;
leg = cell(1,5);

hold on
for i=1:5
    a = as(i);
    b = bs(i);
    E1 = a*Ee;
    eta = b*Ee;
    eps = @(t) sigma0./Ee .* ( 1 - E1./(Ee+E1) .* exp(-(Ee.*E1)./(eta.*(E1+Ee)) .* t));
    ts = 0:0.1:100;
    plot(ts,eps(ts))
    leg{i} = sprintf('a=%.1f, b=%.1f', a, b);
    
end

title('Long term plot of resulting strain')
xlabel('Time (s)')
ylabel('Strain')
legend(leg)
