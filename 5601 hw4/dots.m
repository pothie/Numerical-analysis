%5.8-14
x = rand(1,n);
y = rand(1,n);
pt = [x;y];
d = @(x1,x2,y1,y2) sqrt((x1-x2).^2+(y1-y2).^2);
m1 = 1;
for i = 1:n-1
    [m2,b] = min(d(x(i),x(i+1:n),y(i),y(i+1:n)));
    if m2<m1
        m1 = m2;
        c = b+i;
        r = i;
    end
end
disp("The closest distance is ")
disp(m1)
disp("between point "+num2str(r)+" and " +num2str(c))
hold off
plot([x(c) x(r)], [y(c) y(r)],"r-")
hold on
plot(x,y,".","MarkerSize",10)
axis([0 1 0 1])
xlabel("x")
ylabel("y")
title(n +" points randomly in [0,1] x [0,1]")
