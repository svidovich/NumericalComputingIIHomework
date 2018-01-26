%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                h2p2.m                       %
% Draw the curve exp(2*sin(x))-x over I = [-5,11], and apply the %
% matlab function fminbnd to it.                                 %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get the interval.
x = linspace(-5,11);
% Open first figure.
figure(1);
% Draw on it.
plot(x, exp(2*sin(x))-x);
title('Function Plot');
hold on;
% Use fminbnd.
z = fminbnd('h2p1ret',-5,11);
disp(z);
% Add this point to figure 1 to see if it's a local minimum.
plot(z, exp(2*sin(z))-z,'r*');