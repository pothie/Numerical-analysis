%9.2-5
x = [1];
y = [1/sqrt(2)];
%only store 10^ith item
for i = 1:n-1
    x(i+1) = x(i)+1/x(i);
    y(i+1) = (x(i+1))/sqrt(2*(i+1));
end
semilogx(1:n,y)
ylabel('a_n/sqrt(2*n)')
xlabel('n')