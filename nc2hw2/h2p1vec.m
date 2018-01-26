%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                h2p1vec.m                       %
% Write a function that returns function, derivative, and second %
% derivative values at a selected point.                         %
% This version exists because I like vector outputs.             %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function v = h2p1vec(x)
v = zeros(3,1);
v(1,1) = exp(2*sin(x))-x;
v(2,1) = 2*cos(x)*exp(2*sin(x))-1;
v(3,1) = 4*((cos(x))^2)*exp(2*sin(x))-2*exp(2*sin(x))*sin(x);
