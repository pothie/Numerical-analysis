%hw8_2
n = 2e3;
A = rand(n);
A = A'*A;
b = sin(1:n)';

a_cpu = ones(10,1);
a_tictoc = ones(10,1);
b_cpu = ones(10,1); 
b_tictoc = ones(10,1);
c_cpu = ones(10,1);
c_tictoc = ones(10,1);
d_cpu = ones(10,1); 
d_tictoc = ones(10,1);

for k = 1:10
% a
tic()
t = cputime;
xa = A\b;
a_cpu(k) = cputime-t;
a_tictoc(k) = toc();

% b
opts.SYM = true;
opts.POSDEF = true;
tic()
t = cputime;
xb = linsolve(A,b,opts);
b_cpu(k) = cputime-t;
b_tictoc(k) = toc();

% c
tic()
t = cputime;
R = chol(A);
yc = R'\b;
xc = R\yc;
c_cpu(k) = cputime-t;
c_tictoc(k) = toc();

% d
opts1.LT = true;
opts2.UT = true;
tic()
t = cputime;
R = chol(A);
yd = linsolve(R',b,opts1);
xd = linsolve(R,yd,opts2);
d_cpu(k) = cputime-t;
d_tictoc(k) = toc();
end

Index = (1:10)';
table(Index,a_cpu,a_tictoc,b_cpu,b_tictoc,c_cpu,c_tictoc,d_cpu,d_tictoc)


ans =
  10×9 table
    Index    a_cpu    a_tictoc    b_cpu    b_tictoc    c_cpu    c_tictoc    d_cpu    d_tictoc
    _____    _____    ________    _____    ________    _____    ________    _____    ________
      1       0.3     0.14334     0.14     0.093827    0.12      0.07782    0.21      0.13393
      2      0.15     0.10511     0.14     0.089595     0.2     0.088023    0.22      0.10602
      3      0.18      0.1131     0.17      0.09798    0.19     0.089901    0.16     0.089475
      4      0.17     0.10968     0.28      0.14695    0.16     0.089012    0.22      0.10684
      5      0.27     0.13749     0.19      0.10353    0.13     0.070702    0.21      0.10421
      6      0.31     0.15963     0.23      0.11319    0.13     0.067669    0.12     0.081396
      7      0.17      0.1034     0.14     0.090282    0.19     0.085966    0.25      0.11755
      8      0.18     0.11851     0.14     0.087853    0.13     0.067899    0.22       0.1046
      9      0.28      0.1542     0.16     0.094799    0.12     0.068102    0.16     0.088141
     10      0.27     0.13376     0.22      0.11034    0.14     0.073989    0.15     0.085881