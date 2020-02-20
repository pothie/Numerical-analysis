%9.4-21
A = [1 2 3 4;1 -2 3 -4;2 3 5 7];
b1 = zeros(3,1);
disp('rref of A')
disp(rref([A b1]))

b2 = zeros(4,1);
disp('rref of A transpose')
disp(rref([A' b2]))
