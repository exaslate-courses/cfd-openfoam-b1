%% Approximating derivative using first order numerical scheme.

clear all;
close all;

% Create 1D grid.
x = [0:0.1:1]';
rho = x.^3; % rho = x^3

% Get the length of the array.
n = length(x);

% Plot y = x^3.
figure(1);
plot(x, rho, '-ob', 'linewidth', 2);
hold on;
xlabel('x');
ylabel('\rho=x^3');
set(gca, "linewidth", 2, "fontsize", 16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% First order derivative.

rho_prime = 3*x.^2; % Analytical expression for derivative.

% Estimate gradients numerically using upwind and central difference schemes.
rho_prime_upwind = zeros(size(rho));

rho_prime_upwind(1, 1) = (rho(2, 1) - rho(1, 1)) / (rho(2, 1) - rho(1, 1));
rho_prime_upwind(n, 1) = (rho(n, 1) - rho(n-1, 1)) / (rho(n, 1) - rho(n-1, 1));

% Initialize rho_prime_downwind using rho_prime_upwind.
rho_prime_downwind = rho_prime_upwind;

for i = 2 : length(rho)-1
  % Update rho_prime_upwind using first order upwind scheme.
  rho_prime_upwind(i, 1) = (rho(i+1, 1) - rho(i, 1)) / (x(i+1, 1) - x(i, 1));

  % Update rho_prime_downwind using first order downwind scheme.
  % TODO: Complete code.
end

% Plot comparisons between analytical and numerical values for gradients.
figure(2);
hold on;
plot(x(2:n-1), rho_prime(2:n-1), '-ob', 'linewidth', 3);
plot(x(2:n-1), rho_prime_upwind(2:n-1), '-om', 'linewidth', 2);
plot(x(2:n-1), rho_prime_downwind(2:n-1), '--xc', 'linewidth', 2);
legend('Analytical', 'Upwind', 'Downwind',  'location', 'northwest');
hold on;
xlabel('x');
ylabel('d\rho/dx=3x^2');
box on;
set(gca, "linewidth", 2, "fontsize", 16)
hold off;

