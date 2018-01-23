%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                h1p3ret.m                              %
% Implement Newton's method on exp(2sinx)-x. You will need the function %
% and derivative values. Hopefully you wrote h1p1ret.m correctly.       %
% (not like I did initially)                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function h1p3ret(x,tol)
    format long;
    % Display initial guess.
    disp('Initial Guess for Newton''s method: ')
    disp(x)
    v = h1p1ret(x);
    k = 1;
    
    % Until the function value approaches tolerance,
    while(abs(v(1,1))>tol)
        % Get the function and derivative values,
        v = h1p1ret(x);
        % And perform Newton's method.
        x = x-(v(1,1)/v(2,1));
        % iter k each while step, save xk-x to vector for later
        w(1,k) = x - 2.635713222271392;
        k = k+1;
    end
    % Once we're done, celebrate by printing.
    disp('Newton''s method solution: ')
    disp(x)
    k = num2str(k);
    a = strcat('It took',{' '},k,' iterations.');
    disp(a);
    % Plot the errors
    [m,n]=size(w);
    axis = 1:n;
    figure(2)
    plot(axis,w);
end