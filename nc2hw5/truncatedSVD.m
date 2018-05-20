function x = truncatedSVD(A, b)
% A is nxn; get n. We'll need it for indexing shortly.
[n, ~] = size(A);
%  Compute the SVDecomposition of A.
[U, S, V] = svd(A);
% Let's get U transpose, eh?
Ut = U';
% Initialize x. Who cares how big it is.
x = 0;
% Initialize a vector to hold our singular values.
% Since we don't know how many we're going to keep yet, this
% vector is going to increase in size. 
sv = 0; 
% Now let's choose only the singular values greater than 10^-6.
for i = 1:1:n
    % S, being the matrix of singular values, is diagonal.
    if S(i,i) >= 10^-6
        % This should work: ... >= s(i-1) >= s(i) >= s(i+1) >= ...
        sv(i) = S(i,i);
    end
end
% Now, the length of sv is going to be the size of our truncated A.
% But really we're not at all interested in A, but its inverse.
% We're going to do this all in one loop. To hell with it!
k = length(sv);
for i = 1:1:k
    x = x + ((1/sv(i))*V(:,i)*Ut(i,:)*b);
end


end