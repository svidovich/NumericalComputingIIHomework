function bfgs(x0)
disp('BFGS says: Getting started...');
% Set up a vector to catch trajectory
u = zeros(2,1);
% Get an identity matrix for good measure
I = eye(2);
% Choose initial H as identity
H = I;
% Set up for recursion
xOld = x0;
% Set up for iteration
k = 1;
% Get values we need based on initial guess
[~, g, ~] = h3p2function(xOld);
% Until convergence,
while ( norm(g) >= (10^-6) )
    % Get trajectory
    u(1,k) = xOld(1,1);
    u(2,k) = xOld(2,1);
    % Calculate function at previous x.
    [~, g, ~] = h3p2function(xOld);
    % Get a direction.
    p = -H*g;
    % Get a step size.
    a = linesearch(xOld);
    % Get new x.
    xNew = xOld + a*p;
    
    %%%%%%%%%%%%%%%%%%%
    %  The dark arts  %
    %%%%%%%%%%%%%%%%%%%
    
    % Compute values at new x.
    [~, gNew, ~] = h3p2function(xNew);
    % Updating H.
    s = xNew - xOld;
    y = gNew - g;
    r = 1/(y'*s);
    H = (I - (r*s*y'))*H*(I - (r*y*s')) + r*(s*s');
    % This allows us to approximate the Hessian without actually
    % calculating it.
    if (norm(g) < 10^-6)
        disp('BFGS says: We have reached tolerance.');
    end
    xOld = xNew;
    % Iterate.
    k = k+1;
end

% Time to plot!
disp('BFGS says: Plotting trajectory...');
figure(4)
hold on;
for i = 1:1:k-1
    plot(u(1,i), u(2,i),'ks');
end
legend('Rosenbrock','BFGS Trajectory');
hold off
disp('BFGS says: Done plotting.');

end
