%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This function interpolates Runge using the Lagrange basis!   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function withLagrange(n)

% Generate n domain values and n range values.
[t, y] = generate(n);

% Generate a nice linspace to plot the polynomial over.
domain = -1:0.01:1;
d = length(domain);
% Preallocate an output vector.
output = zeros(d,1);
% Evaluate the Lagrange polynomial.
for k = 1:1:d
    f = Lagrange(t,y,domain(k));
    output(k,1) = f;
end

figure(3)
plot(domain,output);


end
