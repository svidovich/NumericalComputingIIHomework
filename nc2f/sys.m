% sys.m
% This evaluates a 2d system of equations.
% The input is a 2-vector y.
% The output is a 2-vector f.
function f = sys(t,y)
    f = zeros(2,1);
    f(1,1) = -500.5*y(1) + 499.5*y(2);
    f(2,1) = 499.5*y(1) - 500.5*y(2);
end