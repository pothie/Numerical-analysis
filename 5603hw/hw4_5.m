function Q = hw4_5(A)    
    [m, n] = size(A); 
    for j=1:n
        GP = eye(m,n);
        for k=1:j-1
            P = Q(:,k)*Q(:,k)';
            GP = GP-P;
        end
        w = GP*A(:,j);
        Q(:,j) = w/norm(w);
    end
end