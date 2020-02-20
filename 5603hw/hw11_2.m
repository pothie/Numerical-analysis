%hw11_2test
a = 0;
b = 1;
n = 9;%n=99
h = 1/(n+1);
lins = linspace(a,b,n+2);
[xgrid,ygrid] = meshgrid(lins,lins);
u_exact = @(x,y) exp(2*x+y)+cos(x-4*y^2);
exact = u_exact(xgrid(2:end-1,2:end-1),ygrid(2:end-1,2:end-1));
A = sparse(1:n,1:n,4,n,n)+sparse(2:n,1:n-1,-1,n,n)...
    +sparse(1:n-1,2:n,-1,n,n)+sparse(4:n,1:n-3,-1,n,n)...
    +sparse(1:n-3,4:n,-1,n,n);
u0 = @(x,y) 0;
f = A*exact;
time_cpu = zeros(5,1);
time_tic = zeros(5,1);
roc = zeros(5,1);
error_ini = norm(zeros(n)-exact);

% Jacobi & ALDU
uJA = zeros(n);
count = 0;
iteration = 1;
t = cputime();
tic();
while iteration
    L = tril(A,-1);
    U = triu(A,1);
    Di = diag(1./diag(A));
    uJA = Di*(-(L+U)*uJA+f);
    count = count +1;
    if norm(uJA-exact)/error_ini<0.1
        iteration = 0;
    end
end
time_tic(1) = toc();
time_cpu(1) = cputime()-t;
roc(1) = 1/count;

% Jacobi & for loop
uJf = zeros(n+2);
uJf_new = zeros(n+2);
count = 0;
iteration = 1;
t = cputime();
tic();
%while iteration
    for k = 1:1e4
        for i=2:n
            for j=2:n
                uJf_new(i,j) = (h^2*f(i,j)+uJf(i-1,j)+uJf(i+1,j)+uJf(i,j-1)+uJf(i,j+1))/4;
            end
        end
        uJf = uJf_new;
    end
    %count = count +1;
    %if norm(uJf-exact)/error_ini<0.1
    %    iteration = 0;
    %end
%end
time_tic(2) = toc();
time_cpu(2) = cputime()-t;
error_Jf = norm(uJf(2:end-1,2:end-1)-exact);

% Gauss Seidel & ALDU
uGSA = zeros(n);
count = 0;
iteration = 1;
t = cputime();
tic();
while iteration
    for k = 1:1e4
        LD = tril(A);
        U = triu(A,1);
        uGSA = LD\(-U*uGSA+f);
        count  = count+1;
    end
    if norm(uGSA-exact)/error_ini<0.1
        iteration = 0;
    end
end
time_tic(3) = toc();
time_cpu(3) = cputime()-t;
roc(3) = 1/count;

% Gauss Seidel & for loop
uGSf = zeros(n);
count = 0;
iteration = 1;
t = cputime();
tic();
uGSf = u_exact(xgrid,ygrid);
uGSf(2:end-1,2:end-1) =0;
%while iteration
    for i=2:n
        for j=2:n
            uGSf(i,j) = (h^2*f(i,j)+uGSf(i-1,j)+uGSf(i+1,j)+uGSf(i,j-1)+uGSf(i,j+1))/4;
        end
    end
    %count = count +1;
    %if norm(uJA-exact)/error_ini<0.1
    %    iteration = 0;
    %end
%end
time_tic(4) = toc();
time_cpu(4) = cputime()-t;
roc(4) = 1/count;
error_GSf = norm(uGSf(2:end-1,2:end-1)-u_exact(xgrid(2:end-1,2:end-1),ygrid(2:end-1,2:end-1)));

% Gaussian backslash
t = cputime();
tic();
uG = A\f;
time_tic(5) = toc();
time_cpu(5) = cputime()-t;
%error_G = norm(uG-exact);
table((1:5)',time_cpu,time_tic,roc)