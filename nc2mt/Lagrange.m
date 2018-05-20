% This function takes in abscissae tn, ordinates yn, and evaluates
% the lagrange basis at some abscissa x based on them.

function v = Lagrange(tn,yn,x)  % Lagrange Interpolation
    % number of interpolating points
    n = length(tn);
    % number of domain points
    k = length(x);     
    % Initialize output
    v = zeros(1,k);    
    % Initialize storage
    L = ones(n,k);     
    for i=1:n
        for j=1:n
            if j~=i
                L(i,:)=L(i,:).*(x-tn(j))/(tn(i)-tn(j));
            end
        end
        v=v+yn(i)*L(i,:);
    end
end