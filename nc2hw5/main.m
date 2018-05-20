% This is the main part of the program. It solves the integral equation
% using various methods and step sizes, and then plots the solutions in
% comparison to the true solution!


% This is less elegant than it could be, though still functional.
[A10, b10, s10, t10] = generateEquations(10);
[A20, b20, s20, t20] = generateEquations(20);
[A50, b50, s50, t50] = generateEquations(50);

% Matlab Built-in
x10 = A10\b10;
x20 = A20\b20;
x50 = A50\b50;
figure(1);
subplot(3,1,1)
hold on
plot(t50, sin(t50),'k');
plot(t10, x10,'ro');
hold off
legend('sin(x)','n=10');
title('Solving using Matlab Solver');

subplot(3,1,2)
hold on
plot(t50, sin(t50),'k');
plot(t20, x20,'bo');
hold off
legend('sin(x)','n=20');

subplot(3,1,3)
hold on
plot(t50, sin(t50),'k');
plot(t50, x50,'go');
hold off
legend('sin(x)','n=50')

% Truncated SVD
x10 = truncatedSVD(A10, b10);
x20 = truncatedSVD(A20, b20);
x50 = truncatedSVD(A50, b50);
figure(2)
subplot(3,1,1)
hold on
plot(t50, sin(t50),'k');
plot(t10, x10,'ro');
hold off
legend('sin(x)','n=10');
title('Solving using Truncated SVD');

subplot(3,1,2)
hold on
plot(t50, sin(t50),'k');
plot(t20, x20,'bo');
hold off
legend('sin(x)','n=20');

subplot(3,1,3)
hold on
plot(t50, sin(t50),'k');
plot(t50, x50,'go');
hold off
legend('sin(x)','n=50')


% Tikhonov regularization
x10 = tikhonov(A10, b10);
x20 = tikhonov(A20, b20);
x50 = tikhonov(A50, b50);

figure(3)

subplot(3,1,1)
hold on
plot(t50, sin(t50),'k');
plot(t10, x10,'ro');
hold off
legend('sin(x)','n=10');
title('Solving using Tikhonov Regularization');

subplot(3,1,2)
hold on
plot(t50, sin(t50),'k');
plot(t20, x20,'bo');
hold off
legend('sin(x)','n=20');

subplot(3,1,3)
hold on
plot(t50, sin(t50),'k');
plot(t50, x50,'go');
hold off
legend('sin(x)','n=50')


pause;
close all;