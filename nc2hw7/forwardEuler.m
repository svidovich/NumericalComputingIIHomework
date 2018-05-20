% Solve a differential equation using forward Euler's method.

function forwardEuler(n)
    % Initial Vector.
    y0 = [1; 1];
    % Choose when to start,
    t0 = 0; 
    % Choose when to end.
    T = 10; 
   
    % Get the step size.
    h = (T - t0)/n;
    t = linspace(0, T, n+2);
    y(:, 1) = y0;

for i = 1:1:n+1
        y(:,i + 1) = y(:, i) + (h * (feval('myrhs', y(:, i))));
end

% Plot approximation.
plot(t, y, 'o-')

end


