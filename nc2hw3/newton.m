function newton(x0)
disp('Newton says: Getting started...');
[~, g, h] = h3p2function(x0);
x = x0;
k = 1;
u = zeros(2,1);
while (norm(g) >= (10^-6))
    p = h\(-g);
    as = linesearch(x);
    u(1,k) = x(1,1);
    u(2,k) = x(2,1);
    x = x + as*p;
    [~, g, h] = h3p2function(x);
    k = k+1;
    if (norm(g) < (10^-6))
        disp('Newton says: We have reached tolerance.');
    end
end

disp('Newton says: Plotting trajectory...');
figure(2)
hold on;
for i = 1:1:k-1
    plot(u(1,i), u(2,i),'bo');
end
legend('Rosenbrock','Newton Trajectory');
hold off;

disp('Newton says: Done plotting.');
end