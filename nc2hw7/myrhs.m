% Create the matrix differential equation, and save
% it to dy.
function dy = myrhs(yin)
    % Put in whatever A you like. We are in two dimensions.
    A = [-1 1; 0 2];
    % The differential Equation.
    dy = A*yin; 
end