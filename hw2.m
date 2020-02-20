disp("3.1-3")
a = [1:2:n]
%when n=0, vector a is an empty vector because we start from 1 and no
%positive odd number is less than or equal to zero
%when n=pi, vector a consists of two elements:1 and 3 because these two are
%the only positive odd numbers smaller than pi
b = [1:n].^2
c = [1:n^0.5].^2
d = 1./[2:2*n]'
e = [[2:n^2],999999]'
f = sin([2:3*n - 1])'
g = [sin([1:n]),cos([n:-1:1])]'

disp("3.1-4")
r = [1:2:2*n-1]'
s = [7:-3:10-3*n]'
t = [2:3:-1+3*n]'
u = [[2:n+1]./[5:2:3+2*n]]'
v = 2.^[-1:n-2]'
w = [sin([5:3:2+3*n])]'

disp("3.1-8")
a = v(1:2:end)
b = v(2:2:end)

disp("3.1-12")
A = [1 2 3 4;5 6 7 8;9 10 11 12;13 14 15 16]
A = reshape(1:16,4,4)'
B = A^2
x = [1,2,3,4]'
A*x
x'*A
x'*A*x
A*B
B*A
C = A.^2
A*C
C*A
A*x+3*x
(A+3*eye(4))*x
J = ones(4,4)
A*x+3*x
A*x+3*J*x % they are not the same
 
disp("3.1-18")
A = diag(3:2:2*n+1)
B = diag(sin(1:n))+diag(ones(1,n-1),1)
C = diag(3:2:2*n+1)+diag(n*ones(1,n-1),1)
D = ones(n)+diag(2:2:2*n)+diag((n-1)*ones(1,n-1),1)
 
disp("3.1-20")
C1 = [A B;B A]
C2 = [A zeros(n) zeros(n);zeros(n) A zeros(n);zeros(n) zeros(n) A]
C3 = [B eye(n) zeros(n);zeros(n) B eye(n);eye(n) zeros(n) B]
C4 = repmat([A B eye(n)]', 1, m)
H = [ones(n) 3*ones(n) 7*ones(n); 2*ones(n) 6*ones(n) 7*ones(n)]
 
disp("3.2-1")
x = sin(5:5:200);
[m,i] = max(x)
disp("Max value is "+m +" at Index " +i)
[n,j] = min(x)
disp("Min value is "+n +" at Index " +j)
disp("Difference bewteen min and max is " +(m-n))
sum(x)
sum(abs(x))
diff(x)
abs(diff(x))
sum(abs(diff(x)))
min(abs(diff(x)))
[num, ind] = sort(x)
sort_x = [num' ind']
disp([prod(x),mean(x),std(x)])
 
disp("3.2-11")
for n= 10.^[2:2:8]
    v1= sin([1:n])./[1:n];
    v2= 1./[1:n].^2;
    v3= 1./[1:n].^4;
    disp("n = e"+ log10(n) + "  sum1 "+"sum2 "+"sum3")
    disp([sum(v1) sum(v2) sum(v3)])
end
for n= 10.^[2:2:8]
    v1= sin([n:-1:1])./[n:-1:1];
    v2= 1./[n:-1:1].^2;
    v3= 1./[n:-1:1].^4;
    disp("n = e"+ log10(n) + "  sum1 "+"sum2 "+"sum3")
    disp([sum(v1) sum(v2) sum(v3)])
end
 
disp("3.3-1")
[m,i] = max(x)
disp("maximum value = " + m + ",index = " + i + ".")
[row,column] = size(F)
disp("The matrix F has " + row + " rows and " + column + " columns.")
disp("The maximum value of F is " + max(max(F)) +".") 
%max(F) is looking for the max value in each column instead of the whole matrix
disp("The sum of the diagonal elements of F is " + sum(diag(F)))
 
 
 
 