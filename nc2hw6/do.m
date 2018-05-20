t = linspace(0,5);
n = length(t);
ylist1 = zeros(2, n);
for i = 1:1:n
    ylist1(1,i) = 2*exp(-t(i)) - exp(-2*t(i));
    ylist1(2,i) = exp(-2*t(i));
end

ylist2 = zeros(2, n);
for i = 1:1:n
    ylist2(1,i) = (2/3)*exp(-t(i)) + (1/3)*exp(2*t(i));
    ylist2(2,i) = exp(2*t(i));
end

figure(1)
subplot(2,1,1)
hold on
plot(t, ylist1(1,:))
plot(t, ylist1(2,:))
hold off
title('Solution curves to two 2D ODEs')
subplot(2,1,2)
hold on
plot(t, ylist2(1,:))
plot(t, ylist2(2,:))
hold off
