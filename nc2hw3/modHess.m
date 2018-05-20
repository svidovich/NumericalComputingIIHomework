function modHess(x0)
disp('Hessian Modification says: Getting started...');
% Set some threshold d
d = 10^-6;
% Set up for iteration
x = x0;
k = 1;
% Get an identity out
I = eye(2);
% Get gradient and Hessian
[~, g, h] = h3p2function(x);
% Get a stash vector to hold trajectories.
u = zeros(2,1);

% Until convergence,
while (norm(g) >= (10^-6))
   % Stash the trajectory.
   u(1,k) = x(1,1);
   u(2,k) = x(2,1);
   % Get the eigenvalues of the Hessian,
   hessianEigenvalues = eig(h);
   % and select the least of them.
   L = min(hessianEigenvalues);
   % If the least of these eigenvalues is bigger than our threshold,
   if (L >= d)
       % Keep the Hessian.
       B = h;
   % Otherwise,
   else
       % Modify it!
        B = h + (d - L)*I;
   end
   % Get a step direction p.
   p = B\(-g);
   % Get a step length a.
   as = linesearch(x);
   % Get a new coordinate,
   x = x + as*p;
   % and some information to go with it.
   [~, g, h] = h3p2function(x);    
   if (norm(g) < 10^-6)
       disp('Hessian Modification says: We have reached tolerance.');
   end
end

% Time to plot!
disp('Hessian Modification says: Plotting trajectory...');

figure(3)
hold on;
for i = 1:1:k
    plot(u(1,i), u(2,i),'g*');
end
legend('Rosenbrock','Hessian Modification Trajectory');
hold off;

disp('Hessian Modification says: Done plotting.');

end