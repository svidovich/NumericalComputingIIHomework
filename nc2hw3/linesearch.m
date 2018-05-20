function as = linesearch(xk)
% Set some initial steps and a maximum iteration we're going to.
a_previous = 0;
a_current = 1;
n = 10;
[f, g, ~] = h3p2function(xk);
for i = 2:1:n
    [phi_alast_f, ~, ~] = h3p2function(xk - a_previous*g);
    [phi_ai_f, phi_ai_g, ~] = h3p2function(xk - a_current*g);
    if ((phi_ai_f > f + (10^-4)*a_current*(g'*g))||(phi_ai_f > phi_alast_f))
        as = lszoom(a_previous, a_current, xk);
        return;
    end
    if (abs(phi_ai_g'*g) <= 0.9*abs(g'*g))
        as = a_current;
        return;
    end
    if (phi_ai_g'*g >= 0)
        as = lszoom(a_current,a_previous,xk);
        return;
    end
    a_previous = a_current;
    a_current = 2*a_current;
end
           
end

