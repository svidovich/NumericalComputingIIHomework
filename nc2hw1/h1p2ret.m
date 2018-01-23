%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                h1p2ret.m                                %
% Write a Matlab function which implements the bisection method on        %
% exp(2sinx)-x with a tolerance of 10^-12.                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function h1p2ret(a,b,tol)
    % Check to see if the function changes sign on the interval
    if (((exp(2*sin(a))-a)*(exp(2*sin(b))-b))>0)
        % If it doesn't, throw an error
        disp('Bad bracket')
        return
    else
        % If it does, start iter and setup midpoint.
        k=1;
        xk = (a+b)/2;
        while (abs((exp(2*sin(xk))-xk)) > tol)
            % If they have the same sign on the contracted interval,
            if (((exp(2*sin(a))-a)*(exp(2*sin(xk))-xk))>0) 
                % Move left bound to preset midpoint.
                a = xk;
            % If their signs are different on the contracted interval,
            else
                % Move right bound to preset midpoint.
                b = xk;
            end
            % iter k each while step, save xk-x to vector for later
            v(1,k) = xk - 2.635713222271392;
            k = k+1;
            % move bounds each while step
            xk = (a+b)/2;
        end
    end
    disp('Your numerical solution using the interval method is ')
    disp(xk)
    [m,n]=size(v);
    axis = 1:n;
    figure(2)
    plot(axis,v);
end