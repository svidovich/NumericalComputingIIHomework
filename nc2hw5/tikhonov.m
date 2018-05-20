function x = tikhonov(A, b)
    % We will need these matrices!
    [U, S, V] = svd(A);
    % Do this to prevent syntax errors later.
    Ut = U';
    % A is nxn. Use n for indexing.
    [n, ~] = size(A);
    % Initialize x: We're going all the way to n unlike in the truncated
    % SVD method, so it has definite size.
    x = zeros(n,1);
    % The penalty, as prescribed by Dr. Zheng.
    m = 10^(-3);
    % We will hold A's singular values in a vector for easy use.
    sv = zeros(n,1);
    % Stash the singular values:
    for i = 1:1:n
        sv(i) = S(i,i);
    end
    % Now let's compute x.
    for i = 1:1:n
        x = x + ((1/(sv(i) + (m/sv(i))))*V(:,i)*Ut(i,:)*b);
    end
end