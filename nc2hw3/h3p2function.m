% ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ %
% This computes the value of the rosenbrock function given some vector x. %
% It also computes the gradient and hessian given the vector.             %
% ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][ %


function [f, gradient, hessian] = h3p2function(v)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Rosenbrock function is   %
% 100*((y-(x^2))^2) + (1-x)^2  %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get input vector values.
x = v(1,1);
y = v(2,1);

% Calculate the function value.
f = 100*((y-(x^2))^2) + (1-x)^2;

% Calculate the gradient.
gradient = [(-2 + 2*x + 400*(x^3) - 400*x*y);  200*(y-(x^2))];
%gradient = zeroes(2,1);
% Dx(f)
%gradient(1,1) = (2*(-1 + x + 200*(x^3) - 200*x*y);
% Dy(f)
%gradient(2,1) =  200*(y-(x^2));

% Calculate the Hessian.
hessian = zeros(2,2);
% Dxx(f)
hessian(1,1) = -400*(y-(x^2)) + 800*(x^2) + 2;
% Dxy(f)
hessian(1,2) = -400*x;
% Dxy(f)
hessian(2,1) = -400*x;
% Dyy(f)
hessian(2,2) = 200;

end