% This function first generates a selection of chebyshev points based
% on desired resolution, and then evaluates the Runge function at each 
% of the points, returning them to vectors.


function [t, y] = chebyshev(n)

% Chebyshev points seem irrational. Let's not be lossy.
format long
% Preallocate space for t and y vectors.
t = zeros(n,1);
y = zeros(n,1);

% Generate the Chebyshev points.
for k = 1:1:n
    r = ((2*k - 1)*pi)/(2*n);
    t(k,1) = cos(r);
end
% These tend to come out of order. Sorting will help when using the
% Lagrange basis since it is required that t1 < ... < tn.
t = sort(t);

% Evaluate the Runge function at each chosen Chebyshev point.
for j = 1:1:n
    y(j,1) = (1/(1 + (25*(t(j,1)^2))));
end

end