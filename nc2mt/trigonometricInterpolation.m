%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This function interpolates Runge using trigonometric  %
%   methods!                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function trigonometricInterpolation(N)
%N = length(x);
if (mod(N,2) == 0)
    disp('You need to choose an odd number.')
    return;
end
% Set N-1 out of laziness!
P = N-1;
% Initialize x to hold our abscissae
x = zeros(N,1);
for k = 1:N
    % Determine abscissae as defined in (e); fill x.
    x(k,1) = (2*pi*k)/(N);
end
% Sort the abscissae
x = sort(x);

% Initialize f to hold our ordinates
f = zeros(N,1);
for k = 1:N
    % Determine ordinates as defined in (e); fill f.
    f(k,1) = 1/(1 + (25*((x(k,1) - pi)^2)));
end
% Initialize A0 to 0.
A0 = 0;
for k = 1:N
    % A0 is calculated recursively.
    A0 = A0 + ((2/N)*f(k,1));
end
% Calculate M.
M = (N-1)/2;
% Initialize vectors A and B to store interpolating coefficients
% for psi. There are M components to each.
A = zeros(M,1);
B = zeros(M,1);

% Calculate the interpolating coefficients. They differ by a trig function.
for h = 1:M
    for k = 1:N
        A(h,1) = A(h,1) + ((2/N)*(f(k,1)*(cos((2*pi*h*k)/(N)))));
        B(h,1) = B(h,1) + ((2/N)*(f(k,1)*(sin((2*pi*h*k)/(N)))));
    end
end

% It is now time to evaluate the interpolation polynomial!
% We have N abscissae and M coefficients, plus A0.
% Develop a nice domain over which to evaluate.
domain = 0:0.01:6;
d = length(domain);

psivalues = zeros(d,1);
for i = 1:d
    % We will be calculating the ordinates recursively since
    % they require summation. As such, we need to initialize
    % each ordinate to A0/2 so that we can add on to them.
    psivalues(i,1) = A0/2;
    for h = 1:M
        % Recursively calculate the ordinates.
        psivalues(i,1) = psivalues(i,1) + (A(h,1)*cos(h*domain(i))) + (B(h,1)*sin(h*domain(i)));
    end
end

figure(4)
plot(domain,psivalues);

end