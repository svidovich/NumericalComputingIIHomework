% This function first generates equally spaced points on [-1, 1], then
% evaluates the Runge function at each of the points, returning them
% to vectors.


function [t, y] = generate(n)

% Preallocate space for t and y.
t = zeros(n,1);
y = zeros(n,1);

% First, generate n equally spaced points on [-1,1]
for i = 1:1:n
    t(i,1) = -1 + ((2*i-2)/(n-1));
end

% These tend to come in order, unlike the Chebyshev points. As 
% such, sorting the resultant input vector is unnecessary.

% Next, generate the values of the runge function.
for j = 1:1:n
    y(j,1) = (1/(1 + 25*(t(j,1)^2)));
end

end