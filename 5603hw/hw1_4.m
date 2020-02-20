%9.4-1
%a
A = [2 -2 4;3 5 2;-1 3 -3];
b = [18 3 -15]';
aug1 = [A b];
disp(sum(aug1))
disp(rref(aug1))

%b
b(2) = 6;
aug2 = [A b];
disp(sum(aug2)) 
disp(rref(aug2))

%c 
A(3,1) = -3;
aug3 = [A b];
disp(sum(aug3))
disp(rref(aug3))