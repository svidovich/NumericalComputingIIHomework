%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            h1p1ret.m                              %
% Write a Matlab function which returns the function value and its  %
% derivative for a given point                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function v = h1p1ret(x)
     format long;
     % init vector v as storage
     v = zeros(2,1);
     % put function value in first component
     v(1,1) = exp(2*sin(x)) - x;
     % put derivative value in second component
     v(2,1) = 2*cos(x)*exp(2*sin(x))-1;
     
     
     % ////////////////////////////////////////////////////////////////////
     % The original form of this function was to display the results to usr
     % in a nice way. The next few lines contain that code, for my health.
     % % gift for usr:
     % % disp('Function value at selected point:')
     % % disp(v(1,1))
     % % disp('Derivative at selected point:')
     % % disp(v(2,1))
     % ////////////////////////////////////////////////////////////////////
end