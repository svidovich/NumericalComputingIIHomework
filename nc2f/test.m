A = zeros(2,2);
A = [-500.5 499.5; 499.5 -500.5];
y0 = [1 3];
tspan = [0 1];
[t, y] = ode23('sys2', tspan, y0);

plot(t,y)
hold on
ni = linspace(0,1);
plot(ni, 2*exp(-ni) - exp(-1000*ni),'ro');
legend('y1 appx', 'y1 tru');
    
    