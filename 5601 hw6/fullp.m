%10.1-10 (b)
function x = fullp(A,b)
n = length(b);
sc = eye(n);
for i = 1:n-1
    [mc,r] = max(abs(A(i:n,i:n)));
    [mr,c] = max(mc);
    if abs(A(i,i)) < mr
        A([i-1+r(c),i],i:n)= A([i,i-1+r(c)],i:n);
        b([i-1+r(c),i],:) = b([i,i-1+r(c)],:);
        sc(:,[i-1+c,i]) = sc(:,[i,i-1+c]);
        A(:,[i-1+c,i]) = A(:,[i,i-1+c]);
    end
    c = -A(i+1:n,i)/A(i,i);
    A(i+1:n,i:n) = A(i+1:n,i:n)+c*A(i,i:n);
    b(i+1:n,:) = b(i+1:n,:)+c*b(i,:);
end
x(n,:) = b(n,:)/A(n,n);
for i = n-1:-1:1
    x(i,:)=(b(i,:)-A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end
x = sc*x;
