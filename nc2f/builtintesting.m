% builtintesting.m
% This script tests some of the built in ODE solvers, and plots the results
% nicely!

y0 = [1 3];
tspan = [0 1];
tini = linspace(0,1);

figure(1)
subplot(2,1,1)
plot(tini,2*exp(-tini) - exp(-1000*tini));
hold on;
subplot(2,1,1)
plot(tini,2*exp(-tini) + exp(-1000*tini));
title('Actual Solution')

[t, y] = ode45('sys', tspan, y0);
subplot(2,1,2)
plot(t,y)
title('Using ode45 (1/6)')
clearvars t y;
pause

[t, y] = ode23('sys', tspan, y0);
subplot(2,1,2,'replace')
plot(t,y)
title('Using ode23 (2/6)')
clearvars t y;
pause

[t, y] = ode113('sys', tspan, y0);
subplot(2,1,2,'replace')
plot(t,y)
title('Using ode113 (3/6)')
clearvars t y;
pause

[t, y] = ode23s('sys', tspan, y0);
subplot(2,1,2,'replace')
plot(t,y)
title('Using ode23s (4/6)')
clearvars t y;
pause

[t, y] = ode23t('sys', tspan, y0);
subplot(2,1,2,'replace')
plot(t,y)
title('Using ode23t (5/6)')
clearvars t y;
pause

[t, y] = ode23tb('sys', tspan, y0);
subplot(2,1,2,'replace')
plot(t,y)
title('Using ode23tb (6/6)')
clearvars t y;
pause
close all