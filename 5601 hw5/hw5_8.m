%9.3-10(b)
x = 10.^(-1:-1:-20);
% 1
f = @(x) (exp(1).^x-1)./x;
% 2
f1 = @(x) (exp(1).^x-1)./log(exp(1).^x);
% 3
f2 = @(x) (expm1(x))./x;

T =[x' f(x)' f1(x)' f2(x)'];
disp('          x            f(x)        f1(x)        f2(x)')
disp(T);