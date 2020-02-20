%12.3-4
hold off
paper_figure()
%% a
for i=0:5
    xdp = linspace(-1,1,1e6);
    hold on
    l(i+1) = plot(xdp,mylegendre(i,xdp));
end
axis equal
legend(l,{"p0","p1","p2","p3","p4","p5"})
title("mylegendre")

hold off
%% b
for i=0:5
    xdp = linspace(-1,1);
    hold on
    L = legendre(i,xdp);
    l(i+1) = plot(xdp,L(1,:));
end
axis equal
legend(l,{"p0","p1","p2","p3","p4","p5"})
title("MATLAB legendre")
