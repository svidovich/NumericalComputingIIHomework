% Call the forward euler function several times for different values
% of n. Plotting them together, we'll see how the plots increase in
% accuracy.

figure(1)
subplot(4,1,1);
forwardEuler(5);
title('Solutions given increasing n.');
hold on;
subplot(4,1,2);
forwardEuler(15);
subplot(4,1,3);
forwardEuler(50);
subplot(4,1,4);
forwardEuler(100);
hold off;
