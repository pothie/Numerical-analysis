%12.1-2
hold off
paper_figure();
%% a
x = -2:2;
p = [1 0 -3 -1 -1 1 20];
y = polyval(p,x);
pt1 = plot(x,y,"*");
xlabel("x value")
ylabel("p(x)")

%% b 
hold on
x = linspace(-2,2,1000);
y = polyval(p,x);
l1 = plot(x,y,"-");
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%% c
q = polyder(p);
ydp = polyval(q,x);
l2 = plot(x,ydp,"--");
r = sort(roots(q));
r = r(abs(imag(r))<=1e-15);
pt2 = plot(r,polyval(p,r),"x",'MarkerSize',10);

%% d
s = polyder(q);
yds = polyval(s,x);
l3 = plot(x,yds,"-.");
r2 = sort(roots(s));
r2 = r2(abs(imag(r2))<=1e-15);
pt3 = plot(r2,polyval(p,r2),"o",'MarkerSize',10);

legend([l1 pt1 l2 pt2 l3 pt3],{"p(x)","Integer points",...
              "p'(x)","critical points", "p''(x)","points of reflection"});
