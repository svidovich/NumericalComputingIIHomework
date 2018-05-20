%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Integrates with various quadrature rules using 2^n partitions.  %
%                       sin(x) on [0, pi/2]                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function integrate(n)
% The actual value of the integral is 1.
truevalue = 1;
% Setup the number of partitions.
m = 2^n;
% Init vector to hold partition locations
part = zeros(m,1);
% Fill the partition vector
for i = 1:1:m
   part(i) = i*((pi/2)/m);
end

% Integrate using the rectangle rule.
areaR = 0;
for i = 1:1:m-1
    areaR = areaR + ((part(i+1) - part(i))*sin(part(i)));
end
errorR = 1 - areaR;

% Integrate using the midpoint rule.
areaM = 0;
for i = 1:1:m-1
    areaM = areaM + ((part(i+1) - part(i))*(((1/2)*sin(part(i))) + ((1/2)*sin(part(i+1)))));
end
errorM = 1 - areaM;

% Integrate using Simpson's rule.
areaS = 0;
for i = 1:1:m-1
   areaS = areaS + ((part(i+1) - part(i))*(((1/6)*sin(part(i))) + (((4/6)*sin((part(i)+part(i+1))/2) + (((1/6)*sin(part(i+1))))))));
end
errorS = 1 - areaS;

figure(3)
plot(n, errorR,'bo');
plot(n, errorM,'r*');
plot(n, errorS,'gs');


end