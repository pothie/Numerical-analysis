%10.1-9
function x = nop(A,b)
    n = length(b);
    x = zeros(n,1);
    for i = 1:n-1
        c = -A(i+1:n,i)/A(i,i);
        A(i+1:n,i:n) = A(i+1:n,i:n)+c*A(i,i:n);
        b(i+1:n,:) = b(i+1:n,:)+c*b(i,:);
    end
    x(n,:) = b(n,:)/A(n,n);
    for i = n-1:-1:1
        x(i,:)=(b(i,:)-A(i,i+1:n)*x(i+1:n,:))/A(i,i);
    end
end


