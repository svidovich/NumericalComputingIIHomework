% This function solves the 2 dimensional linear differential equation
%                               y' = Ay
% Given A, a coefficient matrix, c & d, an interval on which the solution
% should persist, and v, a 2-vector of initial conditions.

function sol = linODESolve(A, c, d, v)
I = eye(2,2);
t = linspace(c, d);
k = length(t);
ylist = zeros(2, k);
[n, m] = size(A);
if (n ~= 2 || m ~= 2)
    disp('Matrix A should be square.');
end
% Get a matrix to hold A's eigenvalues.
[U, eigenvalues] = eig(A)
p = [1;1];
% Drum up some eigenvectors.
%v1 = ((1/eigenvalues(1))*A)\p;
%v2 = ((1/eigenvalues(2))*A)\p;
% Generate U and its inverse
Ui = inv(U)

for i = 1:1:k
    L = zeros(2,2);
    L(1,1) = exp(eigenvalues(1)*t(i));
    L(2,2) = exp(eigenvalues(2)*t(i));
    y = U*L*Ui*v;
    ylist(1,i) = y(1);
    ylist(2,i) = y(2);
end
sol = ylist;

end