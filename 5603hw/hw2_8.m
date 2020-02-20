%hw2_8
%% a
n = 10;
A = diag(1:n)+n*diag(ones(1,n-1),1);
A(n,1) = 1.0751071549e-6;
[V,D] = eig(A);
disp(diag(D))
disp("n=10,condition number of V: ")
disp(cond(V))

%% b
n = 15;
A = diag(1:n)+n*diag(ones(1,n-1),1);
A(n,1) = 2.866166e-10;
disp('A(n,1) = 2.866166e-10, we have complex eigenvalues.')
[V,D] = eig(A);
disp(diag(D));
disp("n=15,condition number of V: ")
disp(cond(V))

A(n,1) = 2.866165e-10;
disp('A(n,1) = 2.866165e-10, we have real eigenvalues.')
[V,D] = eig(A);
disp(diag(D));
disp("n=15,condition number of V: ")
disp(cond(V))

%% c
n = 20;
A = diag(1:n)+n*diag(ones(1,n-1),1);
A(n,1) = 7.774494e-14;
[V,D] = eig(A);
disp(diag(D));
disp("n=20,condition number of V ")
disp(cond(V))

A(n,1) = 7.774495e-14;
[V,D] = eig(A);
disp(diag(D));
disp("n=20,condition number of V: ")
disp(cond(V))









