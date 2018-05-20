function gradientDescent(x0)
disp('Gradient Descent says: Getting started...');
% x(k) is a 2x1 vector.
% Get an iterator
%k = 1;
% Use first guess
%x(k) = x0;
% Get the value of the gradient at x(k)
[~, g, ~] = h3p2function(x0);
% Get step direction
k = 1;
p = -g;
x = x0;
u = zeros(2,1);
% Until the gradient is about 0 or we've done too many iterations,
while ((norm(p) >= 10^-6) && (k < 20000))
    % Choose a step size
    a = linesearch(x);
    % Iterate
    %k = k + 1;
    u(1,k) = x(1,1);
    u(2,k) = x(2,1);
    % Choose next x
    x = x + a*p;
   
    % Recalculate gradient
    [~, g, ~] = h3p2function(x);
    % Choose next step direction
    p = -g;
    % Iterate
    k=k+1;
    if (norm(p) < 10^-6)
        disp('Gradient Descent says: We have reached tolerance.');
    end
end
disp('Gradient Descent says: Plotting trajectory...');
figure(1)
hold on;
for i = 1:1:k-1
    plot(u(1,i), u(2,i),'rx');
end
legend('Rosenbrock','Gradient Descent Trajectory');
hold off;

disp('Gradient Descent says: Done plotting.')
end