%9.4-2
%a
A = [2 3 3 -5;1 2 1 -4;3 -1 10 9;-1 1 -4 -5];
b = [6 3 9 -3]';
aug1 = [A b];
disp('rref=')
disp(rref(aug1))

%b
A(3,4) = 10;
aug2 = [A b];
disp('rref=')
disp(rref(aug2))

%c 
b(2) = 4;
aug3 = [A b];
disp('rref=')
disp(rref(aug3))