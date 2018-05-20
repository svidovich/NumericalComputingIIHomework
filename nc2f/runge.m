% runge.m
% This is a fourth-order Runge Kutta algorithm.
% Inputs are as follows:
%  A: A 2d matrix from equation y' = Ay
%  h: A scalar, step size
% y0: A 2-vector, initial condition
%  t: A 2-vector, the first element of which is the beginning of the
%     interval of interest, the second element of which is the end.


function [tint, y] = runge(A, h, y0, t)
    tint = t(1):h:t(2);
    n = length(tint);
    y = zeros(2,n);
    y(:,1) = y0;

    for i = 1:1:(n-1)
        k1 = A*y(:,i);
        k2 = A*(y(:,i) + (h/2)*k1);
        k3 = A*(y(:,i) + (h/2)*k2);
        k4 = A*(y(:,i) + h*k3);
        y(:,i+1) = y(:,i) + (h/8)*(k1 + 2*k2 + 2*k3 + k4);
    end
end