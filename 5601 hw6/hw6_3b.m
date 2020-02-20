%10.1-9 (b)
n = 1e3;
A = rand(n);
x = rand(n,1);
b = A*x;

t = cputime();tic()
m = A\b;
time_matlab = toc();tic()
tcpu_matlab = cputime()-t;

t = cputime();tic();
y = nop(A,b);
time_func = toc();tic();
tcpu_func = cputime()-t;

disp(['n value' num2str(n)])
disp(['                  using \ ' '      using function '])
disp(['time elapsed      ' num2str(time_matlab) ...
    '       ' num2str(time_func)])
disp(['cpu time          ' num2str(tcpu_matlab) ...
    '           ' num2str(tcpu_func)])