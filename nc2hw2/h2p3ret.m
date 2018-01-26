%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                h2p3ret.m                       %
% Implement Newton's iteration given tolerance 10^-6 and         %
% selected initial guess.                                        %
% Further, plot the values of the derivative per iteration.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function h2p3ret(x);
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
        % And perform Newton iteration.
        x = x - (v(2,1)/v(3,1));
        % Iterate k.
        k = k+1;
    end
    % Open a figure to demonstrate the convergence of Newton Iteration
    figure(2);
    w = 1:k-1;
    semilogy(w,u);
    title('Convergence Plot, Newton''s Iteration');
    % Add the claimed solution to the first plot
    figure(1);
    plot(x, exp(2*sin(x))-x,'b*');

end