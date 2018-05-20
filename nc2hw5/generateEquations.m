% This function uses a trapezoid rule approximation to generate the
% Matrix A, and RHS function values to generate b.
% The integral equation these represent is
% int(0,pi)[exp(s*cos(t))*x(t)dt] = (exp(s)-exp(-s))/s
%
% The function takes a value n -- think resolution, and returns:
% 1. The matrix A
% 2. The the vector b resulting
% 3. The points s(i), used to generate b
% 4. The points t(i), used to approximate x(t)


function [A, b, s, t] = generateEquations(n)
% Preallocate space for everything we need.
A = zeros(n,n);
b = zeros(n,1);
s = zeros(n,1);
t = zeros(n,1);

% Generate equally spaced points in [0, pi/2]
for i = 1:1:n
    s(i) = (pi*(i-1))/(2*(n-1));
end
% Generate equally spaced points in [0, pi]
for i = 1:1:n
   t(i) = (pi*(i-1))/(n-1); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Now it's time to fill A. The formulas for this can be found in my %
% notes.                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fill the first column.
for i = 1:1:n
   A(i,1) = ((t(2)-t(1))/2)*exp(s(i)*cos(t(1))); 
end
% Fill the last column
for i = 1:1:n
   A(i,n) = ((t(n)-t(n-1))/2)*exp(s(i)*cos(t(n))); 
end
% Fill the middle columns.
for i = 1:1:n % We will fill every row,
    for j = 2:1:(n-1) % But we have already filled columns 1 and n.
        A(i,j) = ((t(j+1)-t(j-1))/2)*exp(s(i)*cos(t(j)));
    end
end

% Now let's generate b.
% The function as outlined in the description is not continuous at 0,
% and with the way the generation of s(i)'s are defined, s(1) is always
% 0. We have options, though: The limit of the function at 0 is 2. So
% instead of trying to generate b(1), we'll just let b(1) = 2.
% The rest of the vector can be generated normally.
b(1) = 2;
for i = 2:1:n
   b(i) = ((exp(s(i)) - exp(-s(i))))/(s(i)); 
end

end