%13.3-3
% a
paper_figure
f = @(x) exp(1).^x;
hold on 
t = linspace(0,2*pi,1e3);
plot(2*cos(t)-1,3*sin(t)+1,'-.');
axis equal
x = linspace(-3,1,1e3);
plot(x,f(x))
axis equal
hold off

% b
fun1 = @(x) exp(1).^x-sqrt(9.*(1-(x+1).^2/4))-1;
x1 = fzero(fun1,[0.5 1]);
fun2 = @(x) exp(1).^x+sqrt(9.*(1-(x+1).^2/4))-1;
x2 = fzero(fun2,[-3 -2.5]);
disp("Points of intersection:");
disp(["("+num2str(x1)+","+num2str(f(x1))+")"...
    "("+num2str(x2)+","+num2str(f(x2))+")"]);