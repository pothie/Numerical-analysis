%4.2-10
%% a
paper_figure()
hold off
f = @(theta,p,a,n) sin(theta).^p./(1+a.*abs(sin(n.*theta)));
x = linspace(0,pi);

graph1 = subplot(2,2,1);
polar(x,f(x,0.5,2,3),"r-");
title(graph1,"p="+num2str(0.5)+", a="+num2str(2)+", n="+num2str(3));

graph2 = subplot(2,2,2);
polar(x,f(x,1,2,3),"r-");
title(graph2,"p="+num2str(1)+", a="+num2str(2)+", n="+num2str(3));

graph3 = subplot(2,2,3);
polar(x,f(x,0.5,1,3),"r-");
title(graph3,"p="+num2str(0.5)+", a="+num2str(1)+", n="+num2str(3));

graph4 = subplot(2,2,4);
polar(x,f(x,0.5,2,1),"r-");
title(graph4,"p="+num2str(0.5)+", a="+num2str(2)+", n="+num2str(1));

%% b
figure
axis equal

graph1 = subplot(2,2,1);
plot(f(x,0.5,2,3).*cos(x),f(x,0.5,2,3).*sin(x),"r-");
title(graph1,"p="+num2str(0.5)+", a="+num2str(2)+", n="+num2str(3));

graph2 = subplot(2,2,2);
plot(f(x,1,2,3).*cos(x),f(x,1,2,3).*sin(x),"r-");
title(graph2,"p="+num2str(1)+", a="+num2str(2)+", n="+num2str(3));

graph3 = subplot(2,2,3);
plot(f(x,0.5,1,3).*cos(x),f(x,0.5,1,3).*sin(x),"r-");
title(graph3,"p="+num2str(0.5)+", a="+num2str(1)+", n="+num2str(3));

graph4 = subplot(2,2,4);
plot(f(x,0.5,2,1).*cos(x),f(x,0.5,2,1).*sin(x),"r-");
title(graph4,"p="+num2str(0.5)+", a="+num2str(2)+", n="+num2str(1));

%% c
figure
graph4 = subplot(1,1,1);
plot(f(x,0.01,1,1).*cos(x),f(x,0.01,1,1).*sin(x),"r-")
title(graph4,"p="+num2str(0.01)+", a="+num2str(1)+", n="+num2str(1));
%When using dots to plot the graphs above, the position of the dots are
%clear. However when we use lines to connect those dots, matlab determines 
%which dots are connected and which are not, possibly according to the distance
%of these dots. In part(c), matlab did not connect the point at the origin
%and a point left to it so the graph is not closed.