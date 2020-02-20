%12.1-1
hold off
paper_figure();
%% a
x = -3:5;
p = [1 -3 -5 2 20];
y = polyval(p,x);
pt1 = plot(x,y,"*");
xlabel("-3 to 5")
ylabel("p(x)")

%% b 
hold on
x = linspace(-3,5,1000);
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
pt2 = plot(r,polyval(p,r),"x",'MarkerSize',10);
disp("p has a maximum at " + num2str(r(2))+".");
disp("p has minima at " + num2str(r(1))+" and " + num2str(r(3))+".");

%% d
s = polyder(q);
yds = polyval(s,x);
l3 = plot(x,yds,"-.");
r2 = sort(roots(s));
pt3 = plot(r2,polyval(p,r2),"o",'MarkerSize',10);
disp("p is concave up in the interval (-Inf," + num2str(r2(1))+").");
disp("p is concave down in the interval (" + num2str(r2(1))+","...
    +num2str(r2(2))+").");
disp("p is concave up in the interval ("+num2str(r2(2))+", Inf).");

legend([l1 pt1 l2 pt2 l3 pt3],{"p(x)","Integer points",...
              "p'(x)","critical points", "p''(x)","points of reflection"});
