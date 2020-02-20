% hw4_1
% defective
A = [1 1e4 0; 0 1 0; 0 0 3];
[V1,D1] = eig(A)
disp("condition number is " )
disp(cond(V1))

% non-defective
B = [1 0 1; 0 1 0; 0 0 3];
[V2,D2] = eig(B)
disp("condition number is " )
disp(cond(V2))
