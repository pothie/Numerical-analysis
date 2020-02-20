%4.2-3
paper_figure()
hold off;
x = [0:4]; 
sol = -exp(2*pi*1i.*x./5);
plot(real(sol),imag(sol),'d')
hold on;
theta = linspace(0,2*pi);
plot(cos(theta),sin(theta));
axis equal
axis([-1 1 -1 1])
xlabel('x axis')
ylabel('y axis')
plot([0 0],ylim,'--r')
plot(xlim,[0 0],'--r')

