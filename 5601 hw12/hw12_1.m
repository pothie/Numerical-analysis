%13.2-5
f1 = @(x,y) x - 1 + (x.*y + 1).*y;
f2 = @(x,y) y + (x.*y + 1).*x;

% Method 1
f = @(xv) [f1(xv(1),xv(2)); f2(xv(1),xv(2))];
psi1 = @(xv) norm(f(xv));
t1 = cputime();
tic();
for i = 1:1e6
    xv = rand(2,1);
    psi1(xv);
end
time1 = toc();
tc1 = cputime()-t1;

% Method 2
psi2 = @(xv) sqrt(f1(xv(1),xv(2))^2 + f2(xv(1),xv(2))^2);
t2 = cputime();
tic();
for i = 1:1e6
    xv = rand(2,1);
    psi2(xv);
end
time2 = toc();
tc2 = cputime()-t2;

% Method 3
psi3 = @(xv) sqrt((xv(1) - 1 + (xv(1)*xv(2) + 1)*xv(2))^2 + ...
(xv(2) + (xv(1).*xv(2) + 1).*xv(1))^2);
t3 = cputime();
tic();
for i = 1:1e6
    xv = rand(2,1);
    psi3(xv);
end
time3 = toc();
tc3 = cputime()-t3;

disp("                      Method 1     Method 2     Method 3")
disp(["time elapsed" time1 time2 time3])
disp(["cputime     " tc1 tc2 tc3])
