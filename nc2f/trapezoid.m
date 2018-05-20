% Trapezoid.m
% This is a trapezoid rule algorithm.
% Inputs are as follows:
%  A: A 2d matrix from equation y' = Ay
%  h: A scalar, step size
% y0: A 2-vector, initial condition
%  t: A 2-vector, the first element of which is the beginning of the
%     interval of interest, the second element of which is the end.

function [tint, y] = trapezoid(A, h, y0, t)
 tint = t(1):h:t(2);
 n = length(tint);
 y = zeros(2,n);
 y(:,1) = y0;
 I = eye(2,2);
 for i = 1:1:(n-1)
     y(:,i+1) = (I - (h/2)*A)\((I + (h/2)*A)*y(:,i));
 end
 end