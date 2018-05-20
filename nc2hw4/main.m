%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This script runs all of the numerical routines!     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


differentiate;
pause;

figure(2)
hold on;
errs = 0;
errMat = 0;
for i = 1:1:15
   errs = differentiateRichardson(i);
   if i <= 5
       subplot(5,1,i)
       x = 1:1:length(errs);
       plot(x,errs);
       if i == 1
            title('Convergence of Forward Difference using Richardson Extrapolation');
       end
   end
end
hold off;
pause;

figure(3)
hold on;
for i = 1:1:10
   integrate(i);
end
hold off
legend('Rectangle Rule','Midpoint Rule','Simpson''s Rule');
title('Error Convergence in Integration of sin(x) on [0, pi/2] using various methods');
pause;

integrateRichardson;
pause;