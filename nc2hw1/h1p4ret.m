%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                h1p4ret.m                              %
% Implement global Newton's method on exp(2sinx)-x. You will need to    %
% provide an initial interval, and then mash the bisection and Newton   %
% algorithms together.                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function h1p4ret(a,b,tol)
    format long;
    % Display initial guess.
    disp('Initial Guess for Global Newton''s method is left end of interval:')
    disp(a)
    v = h1p1ret(a);
    k = 1;

    
    % Check to see if the function changes sign on the interval
    if (((exp(2*sin(a))-a)*(exp(2*sin(b))-b))>0)
        % If it doesn't, throw an error
        disp('Bad bracket')
        return
    else
        x = a;
        % If it does, go ahead with the algorithm
        % Until the function value approaches tolerance,
        while(abs(v(1,1))>tol)
            % Get the function and derivative values,
            v = h1p1ret(x);
            % And perform Newton's method.
            x = x-(v(1,1)/v(2,1));
            % iter k each while step, save xk-x to vector for later
            w(1,k) = x - 2.635713222271392;
            k = k+1;
            
            % If x is in the interval,
            if (x >= a) && (x <= b)
                % leave it alone!
                x;
            % And if it ain't,
            else
                % Change it to the midpoint of the interval.
                x = (a+b)/2;
            end
            
             % If they have the same sign on the contracted interval,
            if (((exp(2*sin(a))-a)*(exp(2*sin(x))-x))>0) 
                % Move left bound to preset midpoint.
                a = x;
            % If their signs are different on the contracted interval,
            else
                % Move right bound to preset midpoint.
                b = x;
            end      
        end
        % Once we're done, celebrate by printing.
        disp('Global Newton''s method solution: ')
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