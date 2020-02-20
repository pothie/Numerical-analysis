function [Q,R] = mgs(A)
[m,n] = size(A); % A ? R
Q = zeros(m,n); % Q ? R
R = zeros(n,n); % R ? Rn×n
B = A; % B = A
    for k = (1:n) % for k = 1, 2, . . . , n
        R(k,k) = norm(B(:,k)); % rkk =
        Q(:,k) = B(:,k)/R(k,k); % qk = z
        R(k,k+1:n) = Q(:,k)'*B(:,k+1:n); 
        B(:,k+1:n) = B(:,k+1:n) - ... % B(k+1) = Be(k)?
        Q(:,k)*R(k,k+1:n); % qk(rk,k+1, rk,k+2, . . . , rk,n)
    end
end
