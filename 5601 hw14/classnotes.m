clear;
s = 1000;
e =1;
f = @(t,y) [y(2);-2*y(2)-e*exp(y(1))];
tspan = [0 1];
y_ic = [0;s];
[t,Y] = ode45(f,tspan,y_ic);
plot(t,Y(:,1));

