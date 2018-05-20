%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This function interpolates and plots with a monomial basis.     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function withMonomial(n)

% Generate n domain values and n range values.
[t, y] = generate(n);

% Construct a matrix to become the Vandermonde matrix.
vMatrix = zeros(n);

% Fill the Vandermonde matrix.
for i = 1:1:n
    for j = 1:1:n
        vMatrix(i,j) = t(i,1)^(n-j);
    end
end
% Solve the matrix equation (vMatrix)x = y for x. These will
% be the coefficients of the interpolating polynomial.
x = vMatrix\y;

% Evaluate the polynomial.
domain = -1:0.01:1;
d = length(domain);
output = zeros(d,1);
for k = 1:1:d
    f = horner(x, domain(k));
    output(k,1) = f;
end



figure(1)
plot(domain,output);


end