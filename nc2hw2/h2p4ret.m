%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                h2p4ret.m                       %
% Implement GCNM given tolerance 10^-6 and                       %
% selected initial guess.                                        %
% Further, plot the values of the derivative per iteration.      %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function h2p4ret(x)
    format long;
    disp('Initial Guess for Newton''s iteration: ')
    disp(x)
    k = 1;
    % Until the derivative is less than our tolerance,
    while(abs(2*cos(x)*exp(2*sin(x))-1) >= 10^-6)
        % Get the proper function and derivative values,
        v = h2p1vec(x);
        % Save the derivative values to a vector,
        u(k,1) = abs(2*cos(x)*exp(2*sin(x))-1);
        % And perform Newton iteration. Save current iterate of x.
        % While you're there, save his function values.
        xk = x;
        w = h2p1vec(xk);
        % Now we'll be replacing x. Easy does it.
        x = x - (v(2,1)/v(3,1));
        % Then:
        % If the function value at x is smaller than that of the previous,
        if (v(1,1) < w(1,1))
            % Keep x.
            x;
        % Otherwise, we need to do some backtracking so we don't get stuck
        % at a maximum unintentionally.
        else
            % So, if the derivative value for xk is negative,
            if (w(2,1) < 0)
                % Set a test value between the two iterates.
                % You're going to need function values there.
                xt = xk + abs(x - xk)/2;
                s = h2p1vec(xt);
                % Let's make the function value at the test x value
                % converge to that of the previous iterate...
                while (s(1,1) >= w(1,1))
                    xt = (xt + xk)/2;
                    s = h2p1vec(xt);
                end
            % Now, if the derivative value for xk is positive or zero,
            else
                % Set a test value between the two iterates.
                % You're going to need function values there.
                xt = xk - abs(x - xk)/2;
                s = h2p1vec(xt);
                % Let's make the function value at the test x value
                % converge to that of the previous iterate...
                while (s(1,1) >= w(1,1))
                    xt = (xt + xk)/2;
                    s = h2p1vec(xt);
                end
            end
            % Now, keep our newfound test x value.
            x = xt;
        end
        % Iterate k.
        k = k+1;
    end
    % Open a figure to demonstrate the convergence of GCNM
    figure(3);
    w = 1:k-1;
    semilogy(w,u);
    title('Convergence Plot, GCNM');
    % Add the claimed solution to the first plot
    figure(1);
    plot(x, exp(2*sin(x))-x,'go');
    legend('Function','Minimum, fminbnd','Critical Point, Newton','Critical Point, GCNM','Location','southwest')

end