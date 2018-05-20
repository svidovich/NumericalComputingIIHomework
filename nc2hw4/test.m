function test(n)
m = 2^n;
% Init vector to hold partition locations
part = zeros(m,1);
% Fill the partition vector
for i = 1:1:m
   part(i) = i*(1/m);
end
% Init h
h = 1;
% Set tolerance
tol = 0.00001;
% Init R to rectangle rule calculation
for i = 1:1:m
    R(i, 1) = 0;
    R(i, 1) = R(1,1) + (((i*h) - ((i-1)*h))*((((i-1)*h)))^2);
    for j = 2:1:i
        R(i,j) = R(i, j-1) + ((R(i,j-1)-R(i-1,j-1))/(4^(j-1)-1));
    end
    h = h/2;
end
area = 0;
for i = 1:1:m
    area = area + R(i,1);
end

disp(area)
