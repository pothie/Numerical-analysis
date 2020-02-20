% 10.1-1
%% a
disp(['       n value' '             A*B       '  '              Ax=b   '])
disp(['' '                      cpu' '        time elapsed' ...
    '    cpu' '   time elapsed ' ...
    '  ratio of cputime' '    ratio of time elapsed'])
for n = [1000:500:5e3] 
    A = rand(n);
    B = rand(n);
    b = rand(n,1);
    t = cputime(); tic()
    C = A*B;
    tcpu_mul = cputime() - t;
    t = cputime();
    time_mul = toc();tic()
    x = A\b;
    tcpu_GE = cputime()-t; 
    time_GE = toc();tic()
    disp([n tcpu_mul time_mul tcpu_GE time_GE tcpu_mul/tcpu_GE... 
         time_mul/time_GE])
end

%% b
disp(['        n values ' '      A\eye(size(A))  ' ...
        '              A^(-1)    ' '        inv(A)  '])
disp(['' '                    cpu' '        time elapsed' ...
    '    cpu' '       time elapsed ' ...
    '    cpu' '      time elapsed '])
for n = [1000:500: 5e3] 
    A = rand(n);
    t = cputime();tic()
    C1 = A\eye(size(A));
    time1 = toc();
    tcpu1 = cputime() - t;
    t = cputime();tic()
    
    C2 = A^(-1);
    time2 = toc();
    tcpu2 = cputime()- t;
    t = cputime();tic()
    
    C3 = inv(A);
    time3 = toc();
    tcpu3 = cputime() - t;
    disp([n tcpu1 time2 tcpu2 time2 tcpu3 time3])
end

