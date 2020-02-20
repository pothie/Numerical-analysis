% 5
function [Q,R] = mygs(A)
    [m, n] = size(A); 
    R = zeros(n);
    for j=1:n
        s = zeros(m,1);
        for k=1:j-1
            s(:,1) = s(:,1) + (Q(:,k)'*A(:,j))*Q(:,k);
        end
        w(:,j) = A(:,j)-s;
        Q(:,j) = w(:,j)/norm(w(:,j))
        R(j,j) = norm(w(:,j));
        R(j,j+1:end) = (A(:,j+1:end)'*Q(:,j))';
    end
end