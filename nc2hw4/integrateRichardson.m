a = 0;
b = pi/2;
x = linspace(0, pi/2);
f = sin(x); 
integer = 1; 
for n = 0:10
    m = 2^n;
    h=(b-a)/m; 
    for i=1:m+1
        x(i) = a+(i-1)*h;
        f(i) = sin(x(i)); 
    end  
    rect(n+1) = sum(f(1:m))*h;
    recterror(n+1) = abs(integer - rect(n+1));
    A(n+1) = sum(f(1:m))*h; 
end
A = A'; 
for i = 1:10
    R(i) = (-1)*(A(i) - 2*A(i +1)); 
end 
% One less iteration than previous operation
for j = 1:9
    M(j) = (R(j) - 2*R(j + 1))/(1 - (2^2)); 
end
% takes 10 iters
R(11) = 0; 
M(10) = 0; 
M(11) = 0; 
for n = 1:10
    h = [h;(b - a)/(2^n)];
end
R = R'; 
M = M';
% Construct a beautiful Richardson Matrix
Richardson = [A, R, M];
disp('The Richardson Matrix when integrating with rectangle rule is: ');
disp(Richardson);
disp('The h vector is structured as follows: ');
disp(h);
domain = 1:1:length(h);
figure(4)
plot(domain,h);
title('Error reduction with Richardson Extrapolation while Integrating');
