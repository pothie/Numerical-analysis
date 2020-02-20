% 13.2-6
% a
f1 = @(x,y,z) sin(x)+y.^2+log(abs(z))-3;
f2 = @(x,y,z) 3*x+2.^y-z.^3;
f3 = @(x,y,z) x.^2+y.^2+z.^3-6;
phi = @(xv) sqrt(f1(xv(1),xv(2),xv(3)).^2+...
    f2(xv(1),xv(2),xv(3)).^2+f3(xv(1),xv(2),xv(3)).^2);
[xmin,pmin] = fminsearch(phi,[1,0,1]);

% b
xnew = @(y,z) (-2.^y+z.^3)./3;
f1new = @(y,z) sin(xnew(y,z))+y.^2+log(abs(z))-3;
f3new = @(y,z) (xnew(y,z)).^2+y.^2+z.^3-6;
y = linspace(-4,4,100);
z = linspace(-4,4,100);
[Y,Z] = meshgrid(y,z);
phi_b = @(v1,v2) sqrt(f1new(v1,v2).^2+f3new(v1,v2).^2);
contour(Y,Z,phi_b(Y,Z),0:1:5);
xlabel('y-value');
ylabel('z-value');
title('phi\_new(Y,Z)');
shg

% c 
phi_c = @(xv) sqrt(f1new(xv(1),xv(2)).^2+f3new(xv(1),xv(2)).^2);
xnmin = [];
pnmin = [];
[xnmin(1,:),pnmin(1)] = fminsearch(phi_c,[-1.5,1.5]);
[xnmin(2,:),pnmin(2)] = fminsearch(phi_c,[-2.2,0]);
[xnmin(3,:),pnmin(3)] = fminsearch(phi_c,[-1.5,-2.2]);
[xnmin(4,:),pnmin(4)] = fminsearch(phi_c,[-1,-2.2]);
[xnmin(5,:),pnmin(5)] = fminsearch(phi_c,[1,-2.2]);
[xnmin(6,:),pnmin(6)] = fminsearch(phi_c,[1.5,-1.5]);
[xnmin(7,:),pnmin(7)] = fminsearch(phi_c,[1.8,2]);
disp("      x-value      y-value      z-value    phi-value")
disp([xnew(xnmin(:,1),xnmin(:,2)) xnmin pnmin'])

