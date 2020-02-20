%13.4-1
t_land1 = @(x1) sqrt((3-x1).^2+4)./10;
t_land2 = @(x2) sqrt((3+x2).^2+4)./4;
t_river = @(x) sqrt(x.^2+1/4)./2;
time = @(xv) t_land1(xv(1))+t_river(xv(1)-xv(2))+t_land2(xv(2));
x0 = [0,0];
[x_min,t_min] = fminsearch(time,x0);
disp("Tiberia can enter the river at x = "+num2str(x_min(1))...
    +" and leave at x = "+num2str(x_min(2)))
disp("Then total min time to buy the book is "+num2str(t_min))