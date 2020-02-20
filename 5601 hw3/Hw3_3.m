%4.2-4
paper_figure();

%a
x = linspace(0,16*pi^2);
f1 = @(x)1+cos(sqrt(x));
y1 = f1(x);
p1 = subplot(3,1,1);
plot(x,y1)
title(p1,'(a)')
ylabel(p1,'y')
xlabel(p1,'x')

%b
f2 = @(x)sqrt(1+cos(x));
y2 = f2(x);
p2 = subplot(3,1,2);
plot(x,y2)
title(p2,'(b)')
ylabel(p2,'y')
xlabel(p2,'x')

%c
p3 = subplot(3,1,3);
x = linspace(0,10*pi);
f3 = @(x) cos(x);
y3 = f3(x);
f4 = @(x) sqrt(1+cos(x).^2);
y4 = f4(x);
hold off
hold on
plot(x,y3,'b')
plot(x,y4,'r:')
plot(x,y3-y4,'g--')
legend('f1','f2','f3')
title(p3,'(c)')
ylabel(p3,'y')
xlabel(p3,'x')
