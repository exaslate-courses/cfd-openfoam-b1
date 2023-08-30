%% Approximating derivative using first order numerical scheme.

clear all;
close all;

x = [0:0.1:1]';
y = x.^2;

n = length(x);

figure(1);
%plot(x, y, '-b', 'linewidth', 2);
plot(x, y, '-ob', 'linewidth', 2);
hold on;
xlabel('x');
ylabel('\rho=x^2');
set(gca, "linewidth", 2, "fontsize", 14)

% gradient
yp = 2*x; % Analytical expression

yp_n1 = zeros(size(y));

yp_n1(1, 1) = (y(2, 1) - y(1, 1)) / (x(2, 1) - x(1, 1));
yp_n1(n, 1) = (y(n, 1) - y(n-1, 1)) / (x(n, 1) - x(n-1, 1));

for i = 2 : length(y)-1
  yp_n1(i, 1) = (y(i+1, 1) - y(i, 1)) / (x(i+1, 1) - x(i, 1));
end

figure(2);
hold on;
plot(x(2:n-1), yp(2:n-1), '-ob', 'linewidth', 2);
plot(x(2:n-1), yp_n1(2:n-1), '-om', 'linewidth', 2);
hold on;
xlabel('x');
ylabel('d\rho/dx=2x');
box on;
set(gca, "linewidth", 2, "fontsize", 14)
hold off;
