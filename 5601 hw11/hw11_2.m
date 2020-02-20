% 13.1-1
% a
paper_figure();
f = @(x) exp(1).^(x.^2);
x = linspace(0,1,1e3);
plot(x,f(x))
axis equal
axis([0 3 1 2.8])
xlabel('x')
ylabel('y')

% b
disp("part(b)")
df = @(x) 2*(x-3)+2*(f(x)-2)*f(x)*2*x;
min = fzero(df,0);
disp("xmin = "+rats(min)+"= "+num2str(min))
disp("ymin = "+rats(f(min))+"= "+num2str(f(min)))
d = @(x) sqrt((x-3)^2+(e^(x^2)-2)^2);
disp("min distance = "+rats(d(min))+"= "+num2str(d(min)))

% c
disp("part(c)")
n = @(x) -2-(3-x)/(2*x*f(x))+f(x);
sol = fzero(n,1);
disp("xmin = "+rats(sol)+"= "+num2str(sol))
