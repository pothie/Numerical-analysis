%hw8_3
n = 1e5;
Sparse_error = ones(10,1);
Gaussian_error = ones(10,1);
Sparse_cpu = ones(10,1);
Sparse_tictoc = ones(10,1);
Gaussian_cpu = ones(10,1); 
Gaussian_tictoc = ones(10,1);

for k=1:10
    li = rand(n,1);
    di = rand(n,1);
    ui = rand(n,1);

    A = sparse(2:n,1:n-1,li(2:n),n,n)+...
        sparse(1:n,1:n,di,n,n)+...
        sparse(1:n-1,2:n,ui(1:n-1),n,n)+...
        sparse([1 n],[n 1],[li(1),ui(n)],n,n);

    x = rand(n,1);
    b = A*x;
    tic()
    t = cputime;
    x1 = hw8_3b(A,b);
    Sparse_cpu(k) = cputime-t;
    Sparse_tictoc(k) = toc();

    tic()
    t = cputime;
    x2 = A\b;
    Gaussian_cpu(k) = cputime-t;
    Gaussian_tictoc(k) = toc();
    
    Sparse_error(k) = norm(x1-x);
    Gaussian_error(k) = norm(x2-x);
end
table(Sparse_error,Gaussian_error,Sparse_cpu,Sparse_tictoc,Gaussian_cpu,Gaussian_tictoc)

ans =
  10×6 table
    Sparse_error    Gaussian_error    Sparse_cpu    Sparse_tictoc    Gaussian_cpu    Gaussian_tictoc
    ____________    ______________    __________    _____________    ____________    _______________
     5.6446e-10       1.8238e-09          0.1          0.11433            0.4            0.34899    
     3.9696e-10       1.6161e-10         0.09         0.070209           0.26            0.23305    
     3.1487e-11       3.4506e-11         0.09         0.066194           0.33            0.25335    
     7.3933e-11       9.1744e-11         0.08         0.064064           0.37             0.2806    
     6.0903e-09            4e-09         0.06         0.057888           0.25            0.21876    
     5.2706e-11       5.9899e-11         0.13         0.075119           0.32            0.24485    
     2.0585e-11       3.2249e-11         0.12          0.07215           0.35            0.23058    
     7.9159e-11        7.327e-11         0.05         0.051039           0.21            0.20114    
     7.9015e-11       9.7537e-11          0.1         0.069172           0.33            0.24763    
       3.77e-11        2.719e-11         0.08         0.063882           0.42            0.27836    