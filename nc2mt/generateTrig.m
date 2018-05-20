function [t, y] = generateTrig(N)
% This function first generates equally spaced points, then
% evaluates the a modified Runge function at each of the points, 
% returning them to vectors.

% Preallocate space for t and y.
t = zeros(N,1);
y = zeros(N,1);

% First, generate N equally spaced points.
for k = 1:N
    % Determine abscissae as defined in (e); fill x.
    t(k,1) = (2*pi*k)/N;
end

% Next, generate the values of the runge function.
for k = 1:N
    % Determine ordinates as defined in (e); fill f.
    y(k,1) = 1/(1 + 25*((t(k,1) - pi)^2));
end

end