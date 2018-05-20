%
%   This function returns a vector containing the errors from Richardson
%   Extrapolation.

function errorVec = differentiateRichardson(hexponent)
format long
% Init h
h = 2^(-hexponent);
% Set tolerance
tol = 0.0000001;
% Init R to first forward difference with init h
R(1, 1) = ((sin((pi/3) + h) - sin((pi/3)))/(h));
% Init vector for convergence plotting. We might not use all of the space.
u = 0;
% Init iter
i = 1;
err = 1;

while( err >= tol)
    h = h/2;
    R(i+1,1) = ((sin((pi/3) + h)-sin((pi/3)))/h);
    for j = 1:i
       R(i+1, j+1) = R(i+1, j) + ((R(i+1, j) - R(i,j))/((4^j)-1));
    end
    err = 2*((abs(R(i+1,i+1) - R(i,i)))/(abs(R(i+1,i+1)) + abs(R(i,i))));
    u(i) = err;
    i = i+1;
end

errorVec = zeros(1,1);
d = length(u);
for i = 1:1:d
    if (u(i) ~= 0)
        errorVec(i,1) = u(i);
    end
end





end