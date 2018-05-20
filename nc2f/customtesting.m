% customtesting.m
% This script tests some of the built in ODE solvers, and plots the results
% nicely!


y0 = [1; 3];
tspan = [0 1];
tini = linspace(0,1);
A = [-500.5 499.5; 499.5 -500.5];
hlo = 10^-2;
hmed = 10^-4;
hhi = 10^-6;

% The first subplot will always be the actual solution
figure(2)
subplot(5,1,1)
plot(tini,2*exp(-tini) - exp(-1000*tini));
axis([0 1 -1 4])
hold on;
plot(tini,2*exp(-tini) + exp(-1000*tini));
axis([0 1 -1 4])
title('Actual Solution')

% Begin by plotting with low accuracy

[t, y] = feuler(A, hlo, y0, tspan);
subplot(5,1,2)
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Forward Euler, h = 0.01');
clearvars t y

[t, y] = beuler(A, hlo, y0, tspan);
subplot(5,1,3)
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Backward Euler, h = 0.01');
clearvars t y

[t, y] = trapezoid(A, hlo, y0, tspan);
subplot(5,1,4)
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Trapezoid, h = 0.01');
clearvars t y

[t, y] = runge(A, hlo, y0, tspan);
subplot(5,1,5)
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Runge-Kutta, h = 0.01');
clearvars t y

pause
% Next, plot with medium accuracy

[t, y] = feuler(A, hmed, y0, tspan);
subplot(5,1,2,'replace')
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Forward Euler, h = 0.0001');
clearvars t y

[t, y] = beuler(A, hmed, y0, tspan);
subplot(5,1,3,'replace')
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Backward Euler, h = 0.0001');
clearvars t y

[t, y] = trapezoid(A, hmed, y0, tspan);
subplot(5,1,4,'replace')
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Trapezoid, h = 0.0001');
clearvars t y

[t, y] = runge(A, hmed, y0, tspan);
subplot(5,1,5,'replace')
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Runge-Kutta, h = 0.0001');
clearvars t y

pause
% Next, plot with high accuracy

[t, y] = feuler(A, hhi, y0, tspan);
subplot(5,1,2,'replace')
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Forward Euler, h = 0.000001');
clearvars t y

[t, y] = beuler(A, hhi, y0, tspan);
subplot(5,1,3,'replace')
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Backward Euler, h = 0.000001');
clearvars t y

[t, y] = trapezoid(A, hhi, y0, tspan);
subplot(5,1,4,'replace')
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Trapezoid, h = 0.000001');
clearvars t y

[t, y] = runge(A, hhi, y0, tspan);
subplot(5,1,5,'replace')
plot(t,y(1,:));
axis([0 1 -1 4])
plot(t,y(2,:));
axis([0 1 -1 4])
title('Runge-Kutta, h = 0.000001');
clearvars t y

pause
close all;