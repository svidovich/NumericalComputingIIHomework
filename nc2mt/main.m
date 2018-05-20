%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This script is the lifeblood of the full program. It    %
%   calls each of the functions, graphing each properly.    %
%                           main.m                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Generate a very good looking Runge function.
[runget, rungey] = generate(5000);
[modrunget, modrungey] = generateTrig(5000);
figure(1)
hold on
plot(runget, rungey);
disp('Monomial: Press any key to begin interpolating.');
pause;
for i = 1:4
    withMonomial(5*i);
    pause; % This can be removed if you just want the solid figure.
           % Pausing will allow you to show each interpolated polynomial
           % after calculation.
end
title('Interpolation of Runge function with Monomial Basis and Equally Spaced Inputs');
legend('Runge','n = 5', 'n = 10', 'n = 15', 'n = 20');
hold off

figure(2)
hold on
plot(runget, rungey);
disp('Chebyshev Monomial: Press any key to begin interpolating.');
pause;
for i = 1:4
    chebyshevMonomial(5*i);
    pause; % This can be removed if you just want the solid figure.
           % Pausing will allow you to show each interpolated polynomial
           % after calculation.
end
title('Interpolation of Runge function with Monomial Basis and Chebyshev Inputs');
legend('Runge','n = 5', 'n = 10', 'n = 15', 'n = 20');
hold off

figure(3)
hold on
plot(runget, rungey);
disp('Lagrange: Press any key to begin interpolating.');
pause;
for i = 1:4
    withLagrange(5*i);
    pause; % This can be removed if you just want the solid figure.
           % Pausing will allow you to show each interpolated polynomial
           % after calculation.
end
title('Interpolation of Runge function with Lagrange Basis and Equally Spaced Inputs');
legend('Runge','n = 5', 'n = 10', 'n = 15', 'n = 20');
hold off

figure(4)
hold on
plot(modrunget,modrungey);
disp('Trigonometric Interpolation: Press any key to begin interpolating.');
pause;
for i = 1:21
    if (i == 5 || i == 11 || i == 15 ||i == 21) 
        trigonometricInterpolation(i);
        pause; % This can be removed if you just want the solid figure.
               % Pausing will allow you to show each interpolated polynomial
               % after calculation.
    else
        continue
    end
end
title('Interpolation using a Trigonometric Function');
legend('Modified Runge','M = 2', 'M = 5', 'M = 7', 'M = 10');
hold off

figure(5)
hold on
plot(runget, rungey);
disp('MATLAB Spline: Press any key to begin interpolating.');
pause;
for i = 1:4
    useSpline(5*i);
    pause; % This can be removed if you just want the solid figure.
           % Pausing will allow you to show each interpolated polynomial
           % after calculation.
end
title('Interpolation of Runge function with MATLAB Spline and Equally Spaced Inputs');
legend('Runge','n = 5', 'n = 10', 'n = 15', 'n = 20');
hold off

pause;
close all;