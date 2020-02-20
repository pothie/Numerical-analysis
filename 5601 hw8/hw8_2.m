%12.1-4
hold off
% a
x = 1:10;
y = primes(30);
m = fliplr(vander(x)); 
c = m\y';

% b 
p = polyfit(x,y,9);
disp(" Using matrix"+"  Using polyfit"+...
    "  Difference")
disp([flip(c) p' abs(flip(c)-p')])

% c
x = 1:11;
y2 = primes(31);
hold on
p1 = plot(x,y2,"*");
p2 = plot(x,polyval(p,x),"o");
legend([p1 p2], {"primes", "p9(x)"});
disp("The difference between p9(11) and 11th prime is: " +...
    num2str(polyval(p,x(11))-y2(11)));

