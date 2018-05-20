%
% Differentiate sine at pi/3 using various methods.
%

% Get 1-15 to to work with later
domain = 1:1:15;
% Preallocate some vectors to hold derivative values
bd = zeros(15,1);
fd = zeros(15,1);
cd = zeros(15,1);

% Allocate actual derivative value
actual = zeros(15,1);
for i = 1:1:15
    actual(i) = 1/2;
end

% Calculate and allocate all derivatives
for i = 1:1:15
   bd(i) = ((sin(pi/3)-sin((pi/3) - (2^-i)))/(2^-i));
   fd(i) = ((sin((pi/3) + (2^-i)) - sin(pi/3))/(2^-i));
   cd(i) = ((sin((pi/3) + (2^-i)) - sin((pi/3) - (2^-i)))/(2*(2^-i)));
end

% Plot
figure(1)
hold on
plot(domain,actual)
plot(domain,bd)
plot(domain,fd)
plot(domain,cd)
legend('Actual','Backward Difference','Forward Difference', 'Center Difference');
title('Differentiation of sin(x) at pi/3 using various methods');
hold off