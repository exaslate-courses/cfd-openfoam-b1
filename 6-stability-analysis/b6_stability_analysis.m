%% Stability analysis.
% rho_prime = c * rho

clear all;
close all;

c = 4;
x_o = 0;
rho_o = 1;

dx = 0.1;

x = [x_o:dx:10]';
rho_analytical = rho_o * exp(-c * (x - x_o));

% Numerical.
rho_numerical = zeros(size(x));
rho_numerical(1, 1) = rho_o;

for i = 2 : length(rho_numerical)
  rho_numerical(i, 1) = rho_numerical(i-1, 1) * (1 - c * dx);
end

% Plot.
figure(1);
hold on;
plot(x, rho_analytical, '-b', 'linewidth', 2);
plot(x, rho_numerical, '-m', 'linewidth', 2);
legend('Analytical', 'Numerical', 'location', 'northwest');
hold on;
xlabel('x');
ylabel('\rho = \rho_o e^{c(x-x_o)}');
box on;
set(gca, "linewidth", 2, "fontsize", 16)
hold off;
