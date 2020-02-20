function [Q,R] = gs(A)
[m,n] = size(A); % A ? R
Q = zeros(m,n); % Q ? R
R = zeros(n); 
R(1,1) = norm(A(:,1)); 
Q(:,1) = A(:,1)/R(1,1); 
for k = (2:n) 
    R(1:k-1,k) = Q(:,1:k-1)'*A(:,k); 
    w = A(:,k) - Q(:,1:k-1)*R(1:k-1,k);
    R(k,k) = norm(w); 
    Q(:,k) = w/R(k,k); 
end

end