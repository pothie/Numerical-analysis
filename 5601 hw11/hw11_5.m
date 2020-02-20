%13.1-18
% a
f = @(x) tanh(10*(x+3));
x = linspace(-6,2,1e5);
plot(x,f(x));
axis equal;
xlabel('x');
ylabel('y');
title('tanh(10(x+3))')

% b
df = @(x) 10*(sech(10*(x+3)))^2;
x1 = 0 - f(0)/df(0);
disp("x1 = "+num2str(x1));
dist_in = abs(x1-(-3));
dist_ly = dist_in*2.68478e-18;
disp("distance from x=-3 to x=x1 is "+num2str(dist_ly)+" light years.")

% c
disp("The diameter of the Milky Wya Galaxy is 105700.0834 light years.")
disp("The distance to Andromeda Galaxy is about 2.5 million light years.")