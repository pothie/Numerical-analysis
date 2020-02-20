%hw2_5
%a 
n = 2000;
A = rand(n,n);
[V,D] = eig(A);
disp(['norm of AV-VD: ' num2str(norm(A*V-V*D))]);

%b
A = [1 1;0 1];
[V,D] = eig(A);
disp([V;D])
