%% Numerical solution for du/dt + c du/dx = 0.
close all;
clear all;

% Initial setup parameters.
L = 1;
n_x = 100;
c = 0.1;
t_initial = 0;
t_final = 1;
dt = 0.01;
dx = L/n_x;

% Setup 1D grid.
x = [0:dx:L]';

% Setup initial condition for "u".
u = zeros(size(x));

for i = 1 : length(x)
  if (x(i, 1) >= 0.1) && (x(i, 1) <= 0.3)
    u(i, 1) = 1;
  endif
end

u_initial = u; % Variable to store initial values.
u_analytical = u; % Variable to store analytical solution.

% Print CFL number.
fprintf("CFL number: %.2e\n", c * dt / dx);

count = 1;
for t = t_initial : dt : t_final
  % Store old values.
  u_old = u;

  % Compute analytical solution.
  u_analytical = zeros(size(x));
  for i = 1 : length(x)
    if (x(i, 1) >= 0.1+c*t) && (x(i, 1) <= 0.3+c*t)
      u_analytical(i, 1) = 1;
    endif
  end

  % Print current time.
  fprintf("Time: %.6es\n", t);

  % Solve advection equation. Update 'u'.
  % Ignore boundaries.

  % Upwind scheme.
  for i = 2 : length(x)-1
    if (c >= 0)
      u(i, 1) = u_old(i, 1) - (c * dt / dx) * (u_old(i, 1) - u_old(i-1, 1));
    else
      u(i, 1) = u_old(i, 1) - (c * dt / dx) * (u_old(i+1, 1) - u_old(i, 1));
    end
  endfor

  % Plot u.
  close;
  figh = figure(1);
  hold on;
  plot(x, u_initial, '-r', 'linewidth', 2);
  plot(x, u_analytical, '-m', 'linewidth', 2);
  plot(x, u, '-b', 'linewidth', 2);
  legend('Initial: u', 'Analytical', 'Numerical: u', 'location', 'northeast');
  hold on;
  xlabel('x');
  ylabel('u');
  box on;
  set(gca, "linewidth", 2, "fontsize", 20)
  hold off;

  fig_name = sprintf('./a11_wave_eq_images/c_upwind/%d.png', count);
  saveas(figh, fig_name);

  count = count + 1;

  pause(0.01);
end

