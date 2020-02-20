%10.3-4

%% a
disp('   S=tridaig(1,-2,1)')
disp(['     n value   ' '   cpu time   ' ' elapsed time' '  error '])
for n = [1e5 1e6 1e7]
    S = sparse(1:n,1:n,-2,n,n) + sparse(2:n,1:n-1,1,n,n)...
     +sparse(1:n-1,2:n,1,n,n);
    x = rand(n,1);
    b = S*x;
    ta = cputime();tic()
    xa = S\b;
    time_cpu_a = cputime()-ta;
    time_tick_a = toc();
    disp([n  time_cpu_a time_tick_a norm(xa-x)])
end

%% b
disp('   T=tridiag(1,-3,1)')
disp(['     n value   ' '   cpu time   ' ' elapsed time' '  error '])
for n = [1e5 1e6 1e7]
    T = sparse(1:n,1:n,-3,n,n) + sparse(2:n,1:n-1,1,n,n)+sparse(1:n-1,2:n,1,n,n);
    x = rand(n,1);
    b = T*x;
    tb = cputime();tic()
    xb = T\b;
    time_cpu_b = cputime()-tb;
    time_tick_b = toc();
    disp([n time_cpu_b time_tick_b norm(xb-x)])
end

%% c
disp('   S2: diag(1,2,6,-2,-1)')
disp(['     n value   ' '   cpu time   ' ' elapsed time' '  error '])
for n = [1e5 1e6 1e7]
    S2 = sparse(1:n,1:n,6,n,n) + sparse(2:n,1:n-1,2,n,n)...
        +sparse(1:n-1,2:n,-2,n,n)+sparse(3:n,1:n-2,-2,n,n)...
        +sparse(1:n-2,3:n,-1,n,n);
    x = rand(n,1);
    b = S2*x;
    xc = S2\b;
    tc = cputime();tic()
    time_cpu_c = cputime()-tc;
    time_tick_c = toc();
    disp([n time_cpu_c time_tick_c norm(xc-x)])
end