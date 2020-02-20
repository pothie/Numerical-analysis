%13.3-5
t_land = @(x) sqrt((3-x).^2+4)./4;
t_river = @(x) sqrt(x.^2+1/16)./2;
time = @(x) 2*(t_land(x)+t_river(x));
[x_min,t_min] = fminbnd(time,0,3);
disp("Tiberia can enter the river at x = "+num2str(x_min))
disp("Then min time for walking on the land is "+num2str(2*t_land(x_min)))
disp("Then total min time to buy the book is "+num2str(t_min))






