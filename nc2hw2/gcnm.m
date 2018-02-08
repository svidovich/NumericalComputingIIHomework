%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This is code for a globally convergent Newton's method that     %
%   utilizes backtracking. It has quadratic convergence.            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function gcnm(x)
    format long;
    disp('Initial Guess for Newton''s iteration: ')
    disp(x)
    % Set the iterate
    k = 1;
    % Set the iterator
    x(k) = x;
    % Git first function value
    v = h2p1vec(x(k));
    % While the derivative value is bigger than tolerance,
    while(abs(v(2,1)) > 10^-6)
        % Do a Newton step of second order
        xN = x(k) - (v(2,1)/v(3,1));
        % Save values for xN
        n = h2p1vec(xN);
        % Save absolute derivative values into a vector for plotting
        u(k,1) = abs(2*cos(x(k))*exp(2*sin(x(k)))-1);
        % if f(xN) < f(xk),
        if (n(1,1) < v(1,1))
            % Set the new iterator to be xN.
            x(k+1) = xN;
        else
            % Otherwise, if f'(xk) is negative,
            if (v(2,1) < 0)
                % Choose a test value,
                xT = x(k) + (abs(xN - x(k))/2);
                % And get function and derivative values there; then,
                t = h2p1vec(xT);
                % Until they match up,
                while ( t(1,1) >= v(1,1) )
                    % Pick points between them and inch along the curve to
                    % the right.
                    xT = (x(k) + xT)/2;
                    t = h2p1vec(xT);
                end
            % But if f'(xk) is non-negative,
            else
                % Choose a test value,
                xT = x(k) - (abs(xN - x(k)))/2;
                % And get function and derivative values there; then,
                t = h2p1vec(xT);
                % Until they match up,
                while ( t(1,1) >= v(1,1) )
                    % Pick points between them and inch along the curve to
                    % the left.
                    xT = (x(k) + xT)/2;
                    t = h2p1vec(xT);
                end
            end
            % Once they match up, set the iterator to be our test value.
            x(k+1) = xT;
        end
    % Get the function values for the iterator so we can reboot the loop.
    v = h2p1vec(x(k+1));
    % Iterate.
    k = k+1;
    % Open a figure to demonstrate the convergence of GCNM
    figure(3);
    w = 1:k-1;
    semilogy(w,u);
    title('Convergence Plot, GCNM');
    
    end
    % Add the claimed solution to the first plot
    figure(1);
    plot(x(k), exp(2*sin(x(k)))-x(k),'go');
    legend('Function','Minimum, fminbnd','Critical Point, Newton','Critical Point, GCNM','Location','southwest')
end
    
            