% Horner's scheme for evaluating a polynomial!
% Input x is the coefficient vector for some polynomial,
% Input t is the value at which we evaluate.
% Output f is the gathered function value.

function f = horner(x,t)
n = length(x);
x1 = x(1,1);
result = x(1,1);
% Horner's method is by nature recursive.
for j = 2:1:n
    result = result*t + x(j,1);
end
f = result;