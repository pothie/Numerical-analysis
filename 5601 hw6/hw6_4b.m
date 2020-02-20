% 10.1-10 (b)
disp(['  n values   ' '  no pivots' ...
    '          patial pivoting        '....
    ' full     ' '        matlab \'])
disp(['         ' '     cpu   ' '   elapsed    '    ...
    'cpu    ' '   elapsed   '    ...
    'cpu      ' 'elapsed    ' 'cpu    ' '   elapsed           '])
for n =[500:100:1000]
    A = rand(n);
    x = rand(n,1);
    b = A*x;

    t = cputime();tic();
    f = fullp(A,b);
    tf = cputime()-t;
    t = cputime();
    tfe = toc();tic();

    p = partialp(A,b);
    tp = cputime()-t;
    t = cputime();
    tpe = toc();tic();

    np = nop(A,b);
    tn = cputime()-t;
    t = cputime();
    tne = toc();tic();

    g = A\b;
    tm = cputime()-t;
    t = cputime();
    tme = toc();
    disp([n tf tfe tp tpe tn tne tm tme])
end