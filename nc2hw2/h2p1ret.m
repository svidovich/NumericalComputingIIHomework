%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                h2p1ret.m                       %
% Write a function that returns function, derivative, and second %
% derivative values at a selected point.                         %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [f,g,h] = h2p1ret(x)
f = exp(2*sin(x))-x;
g = 2*cos(x)*exp(2*sin(x))-1;
h = 4*((cos(x))^2)*exp(2*sin(x))-2*exp(2*sin(x))*sin(x);
