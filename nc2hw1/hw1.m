%%%%%%%%%%%%%
% Problem 1 %
%%%%%%%%%%%%%

% Plot the function exp(2sinx) - x
x = linspace(-10,10);
figure(1)
plot(x,exp(2*sin(x))-x)

% Find a solution to exp(2sinx) - x = 0 using fzero
disp('The solution to the nonlinear equation using fzero is ')
func = @(x) exp(2*sin(x))-x;
x0 = 2;
fzero(func,x0)

% Write a Matlab function which returns the function value and its
% derivative for a given point
% > The derivative of exp(2sinx)-x is 2cosx*exp(2sinx)-1
% Find the matlab code for the function in h1p1ret.m

%%%%%%%%%%%%%
% Problem 2 %
%%%%%%%%%%%%%

% Write a Matlab function which implements the bisection method on exp(2sinx)-x
% with a tolerance of 10^-12.
% Find the matlab code for the function in h1p2ret.m
figure(2)
disp('Bisection method: ')
h1p2ret(-8,8,10^-12)
usrin = input('Enter the x value whose function value and derivative you want to know: ');
h1p1ret(usrin)
clearvars usrin;
hold on;

%%%%%%%%%%%%%
% Problem 3 %
%%%%%%%%%%%%%

% Implement Newton's method on exp(2sinx)-x. You will need the function 
% and derivative values. 
disp('Newton''s Method:')
usrin = input('Enter an initial guess: ')
h1p3ret(usrin,10^-12)
clearvars usrin;

% Try it out for multiple initial guesses.
% % for i=-6:6
% %     h1p3ret(i,10^-12)
% % end

%%%%%%%%%%%%%
% Problem 4 %
%%%%%%%%%%%%%

% Implement global Newton's method on exp(2sinx)-x. You will need to
% provide an initial interval, and then mash the bisection and Newton
% algorithms together.

disp('Global Newton''s Method:')
h1p4ret(-8,8,10^-12)
hold off;