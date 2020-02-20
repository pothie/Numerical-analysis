%4.2-7
hold off

%% a
paper_figure()
x= linspace(0,1000);
y1=sin(x);
hold on
g1=subplot(3,1,1);
plot(x,y1)
title(g1,"sin(x)")
ylabel("sin(x)")
xlabel("x")

n= 0:1000;
g2=subplot(3,1,2);
y2 = sin(n);
plot(n,y2,".r","MarkerSize",1)
title(g2,"sin(x), MarkerSize=1")
ylabel("sin(x)")
xlabel("x")

g3=subplot(3,1,3);
plot(n,y2,".r","MarkerSize",6)
title(g3,"sin(x), MarkerSize=6")
ylabel("sin(x)")
xlabel("x")


%% b
paper_figure()
n = 0:10000;
y2 = sin(n);
b1=subplot(2,1,1);
plot(n,y2,".r","MarkerSize",1)
title(b1,"sin(n), MarkerSize=1")
ylabel("sin(x)")
xlabel("x")

b2=subplot(2,1,2);
plot(n,y2,".r","MarkerSize",6)
title(b2,"sin(x), MarkerSize=6")
ylabel("sin(x)")
xlabel("x")

%% c
paper_figure()
n = 1:10;
disp("                     n"+"        sin(22*n)"+ "   sin(44*n)");
disp([n;sin(22*n);sin(44*n)]')

n = 0:10000;
y = @(n) sin(n);
y2 = y(n);
plot(n,y2,".r","MarkerSize",1);
n_44 = [];
hold off
hold on
for i=1:10000
    if mod(i,44) == 0
        n_44 = [n_44 i];
    end
end
plot(n_44,y(n_44),".b","MarkerSize",6);
%By taking the 44th value of n, we get a stretched sin(x) graph.
%Mathematically, we obtain the graph y=sin(44x). Also the scale of x-axis
%is dense so that if we zoom in to n in (0,1000),the graph is close to x=0,
%which is close to sin(a*pi) where a is an integer.

%% d
paper_figure()
hold off
n1 = 0:10:1000;
f = @(x) sin(x);
d1 = subplot(2,1,1);
plot(n1,f(floor(n1*pi)),"-b")
title(d1,"sin(x),x=0,10pi,20pi...")
ylabel("sin(x)")
xlabel("x")

n2 = 0:11:1001;
d2 = subplot(2,1,2);
plot(n2,f(floor(n2*pi)),"-r")
title(d2,"sin(x),x=0,11pi,22pi...")
ylabel("sin(x)")
xlabel("x")
 