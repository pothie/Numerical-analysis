%hw2_4
%a
disp('n     cputime    tictoc')
for  n = 1e3:500:5e3
    A = randn(n);
    tic()
    t1 = cputime();
    [U,S,V] = svd(A);
    t1 = cputime()-t1;
    t2 = toc();
    disp([n,t1,t2])
end

%b
disp('n     cputime    tictoc')
for  n = 1e3:500:5e3
    A = randn(n);
    A = A.* A';
    tic()
    t1 = cputime();
    [U,S,V] = svd(A);
    t1 = cputime()-t1;
    t2 = toc();
    disp([n,t1,t2])
end
