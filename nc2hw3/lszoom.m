function as = lszoom(aLo,aHi,xk)
% Choose a maximum number of steps to perform.
n = 50;
[f, g, ~] = h3p2function(xk);
for i = 1:1:n
    aMid = (aLo + aHi)/2;
    % Get phi at aMid [f(xk - aMid*(gradf(xk))]
    [phi_aMid_f, phi_aMid_g, ~] = h3p2function(xk - aMid*g);
    % Get phi at aLo [f(xk - aLo*(gradf(xk))]
    [phi_aLo_f, ~, ~] = h3p2function(xk - aLo*g);
    % Here goes some black magic. We need to fit certain specific
    % conditions in order for this to work.
    if ((phi_aMid_f > f - (10^-4)*aMid*(g'*g)) || (phi_aMid_f > phi_aLo_f))
        aHi = aMid;
    else
        if (abs(((-phi_aMid_g')*g)) <= 0.9*abs(((-g')*g)))
            as = aMid;
            return;
        end
        if ((-phi_aMid_g'*g)*(aHi - aLo) >= 0)
            aHi = aLo;
        end
      aLo = aMid;
    end
end
