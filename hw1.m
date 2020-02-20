%2.2-14
%b
mps_a = 100
kph = mps_a*3.6
mph = kph*0.621371
knot = mps_a*1.94384
fpf = mps_a*6012.88475
fpfa = mps_a*6343.593414
ratiospl = mps_a/299792458

%c 
mps_c = 5/3.6 %source: https://www.explainthatstuff.com/historyofcars.html
kph = mps_c*3.6
mph = mps_c*0.621371
knot = mps_c*1.94384
fpf = mps_c*6012.88475
fpfa = mps_c*6343.593414
ratiospl = mps_c/299792458

%2.4-9
p = 'Enter the value of x: ';
x = input(p)
y = [sqrt(x)*(sqrt(x+1)-sqrt(x)),sqrt(2)*exp(1)^(3*x/2)*(sqrt(cosh(x))-sqrt(sinh(x))),x*(log(x+1)-log(x))]
while x ~= 0
    p = 'Enter the value of x: ';
    x = input(p)
    y = [sqrt(x)*(sqrt(x+1)-sqrt(x)),sqrt(2)*exp(1)^(3*x/2)*(sqrt(cosh(x))-sqrt(sinh(x))),x*(log(x+1)-log(x))]
end


