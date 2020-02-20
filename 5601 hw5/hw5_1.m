%5.8-14
x = rand(1,n);
y = rand(1,n);
pt = [x' y'];
d = @(v1,v2) sqrt((pt(v1)-pt(v2)).^2+(pt(v1,2)-pt(v2,2)).^2);
com = nchoosek(1:n,2);
[m,b] = min(d(com(1:end,1),com(1:end,2)));
disp("The closest distance is ")
disp(m)
disp("between point "+num2str(com(b,1))+" and " +num2str(com(b,2)))
hold off
plot([pt(com(b,1)) pt(com(b,2))], [pt(com(b,1),2) pt(com(b,2),2)],"r-")
hold on
plot(x,y,".","MarkerSize",10)
axis([0 1 0 1])
xlabel("x")
ylabel("y")
title(n +" points randomly in [0,1] x [0,1]")
