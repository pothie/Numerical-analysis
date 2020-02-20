%10.1-10(a)

function x = partialp(A,b)

n = length(b);
for i = 1:n-1
    [m,r] = max(abs(A(i:n,i:n)));
    if abs(A(i,i)) < m
        A([i-1+r(1),i],i:n)= A([i,i-1+r(1)],i:n);
        b([i-1+r(1),i],:) = b([i,i-1+r(1)],:);
    end
    c = -A(i+1:n,i)/A(i,i);
    A(i+1:n,i:n) = A(i+1:n,i:n)+c*A(i,i:n);
    b(i+1:n,:) = b(i+1:n,:)+c*b(i,:);
end
x(n,:) = b(n,:)/A(n,n);

for i = n-1:-1:1
    x(i,:)=(b(i,:)-A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end