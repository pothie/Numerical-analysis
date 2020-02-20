err = ones(10,1);
n = 1e3;
for i =1:10
    A = rand(n);
    A = A'*A;
    v = rand(n,1);
    lambda = v'*A*v;
        while err(i,1) > 1e-8
        w = (A-lambda*eye(n))\v;
        v = w/norm(w);
        lambda = v'*A*v;
        err(i,1) = norm(A*v-lambda*v);
        end
end
table((1:10)',err)

     
err = ones(10,1);
n = 5;
for i =1:10
    A = rand(n);
    A = A'*A;
    v = rand(n,1);
    lambda = v'*A*v;
        while err(i,1) > 1e-8
        w = (A-lambda*eye(n))\v;
        v = w/norm(w);
        lambda = v'*A*v;
        err(i,1) = norm(A*v-lambda*v);
        end
end
table((1:10)',err)
ans =
  10×2 table
    Var1       err    
    ____    __________
      1     3.2009e-16
      2     1.7915e-12
      3     3.8715e-16
      4     1.8971e-15
      5     7.6919e-16
      6     4.7442e-17
      7     8.0059e-16
      8     7.6919e-16
      9     7.6919e-16
     10     2.4842e-13

