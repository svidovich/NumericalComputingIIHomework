%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Numerical Computing II Homework III            %
%                                                                 %
% This assignment tests various methods for minimizing a function %
% of two variables.					  	  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Prep Initial Guess
x0 = zeros(2,1);
x0(1,1) = -2;
x0(2,1) = -5;
x = linspace(-5,5);
y = linspace(-5,5);
[X,Y] = meshgrid(x,y);
R = 100*((Y-(X.^2)).^2) + (1-X).^2;

% Gradient Descent
disp('Opening figure 1 for Gradient Descent...');
figure(1)
contour(X,Y,R,250);
% see gradientDescent.m
gradientDescent(x0);

% Newton's method
disp('Opening figure 2 for Newton...');
figure(2)
contour(X,Y,R,250);
% see newton.m
newton(x0);

% Hessian Modification
disp('Opening figure 3 for Hessian Modification...');
figure(3)
contour(X,Y,R,250);
% see modHess.m
modHess(x0);

% BFGS
disp('Opening figure 4 for BFGS...');
figure(4)
contour(X,Y,R,250);
% see bfgs.m
bfgs(x0);