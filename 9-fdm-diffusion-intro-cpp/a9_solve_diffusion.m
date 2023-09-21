%% Solve diffusion equation.

clear all;
close all;

% Create 1D grid.
dx = 0.05;
x = [0:dx:1]';

% Get the length of the array.
n = length(x);

alpha = 1;

% Time control.
t_initial = 0;
t_final = 0.2; %1e-4;
dt = 1e-3; % dx^2 / (2 * alpha);

% Boundary conditions.
T_left = 300;
T_right = 273;

T_initial = 350 * ones(n, 1);
T_numerical = T_initial;

% Set boundary conditions.
T_numerical(1, 1) = T_left;
T_numerical(n, 1) = T_right;

count = 1;
% Solve diffusion equation.
for t = t_initial : dt : t_final
  fprintf('Time: %.3e\n', t);
  T_old = T_numerical;
  for i = 2 : n-1
    T_numerical(i, 1) = T_old(i, 1) + dt * alpha * (T_old(i+1, 1) - 2*T_old(i, 1) + T_old(i-1, 1)) / dx^2;
  endfor

  % Plot u.
  close;
  figh = figure(1);
  hold on;
  plot(x, T_initial, '-r', 'linewidth', 2);
  plot(x, T_numerical, '-m', 'linewidth', 2);
  legend('Initial T', 'Numerical T', 'location', 'southwest');
  hold on;
  xlabel('x');
  ylabel('T(x, t)');
  box on;
  set(gca, "linewidth", 2, "fontsize", 20)
  hold off;

  fig_name = sprintf('./a9_diffusion_eq_images/%d.png', count);
  saveas(figh, fig_name);

  count = count + 1;

  pause(0.01);
end

