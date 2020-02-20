%10.1-10 (d) (iii)
n = 1000;
A = zeros(n);
for i=1:n-1
    A = A + diag(-1*ones(1,n-i),-i);
end
A = A + diag(ones(1,n));
A(:,n) = ones(1,n);
x = rand(n,1);
b = A*x;
bf = fullp(A,b);
bp = partialp(A,b);
for i = 1:n
    for j = 1:n
        if A(i,j) ~= 0
            A(i,j) = -10^(-8)+(2*10^(-8))*rand();
        end
    end
end
af = fullp(A,b);
ap = partialp(A,b);
disp([ "           accurency of partial pivoting      " ...
     " accurency of full pivoting        "])
disp(["Before perturbation:  "   num2str(norm(x-bp)) ...
    num2str(norm(x-ap)) ])
disp(["After perturbation:  "   num2str(norm(x-bf))  num2str(norm(x-af)) ])