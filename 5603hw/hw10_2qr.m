%hw10_2a
function y = hw10_2qr(A)
    n = length(A);
    B = hess(A);
    tol = 1e-13;
    p = n;

    while p > 2
        m = p-1;
        s = B(m,m)+B(p,p);
        t = B(m,m)*B(p,p)-B(m,p)*B(p,m);
        mu = (s+sqrt(s^2-4*t))/2;

        [Q1,R1] = qr(B(1:p,1:p)-mu*eye(p));
        B1 = R1*Q1+mu*eye(p);
        [Q2,R2] = qr(B1(1:p,1:p)-mu'*eye(p));
        B2 = R2*Q2+mu'*eye(p);

        M = B(1:p,1:p)^2-2*real(mu)*B(1:p,1:p)+mu*mu'*eye(p);
        [Q,~] = qr(M);
        B(1:p,1:p) = Q'*B(1:p,1:p)*Q;

        if norm(B(p,m))<tol
            B(p,m) = 0;
            p = p-1;
        elseif norm(B(p-1,m-1))<tol
            B(p-1,m-1) = 0;
            p = p-2;
        end
    end

    % find the complex eigenvalues
    for j = 1:n-1
        if abs(B(j+1,j))>tol
            d = B(j,j)*B(j+1,j+1)-B(j+1,j)*B(j,j+1);
            t = B(j,j)+B(j+1,j+1);
            B(j,j) = (t+sqrt(t^2-4*d))/2;
            B(j+1,j+1) = (t-sqrt(t^2-4*d))/2;
            B(j,j+1) = 0;
            B(j+1,j) = 0;
        end
    end
    y = diag(B);
end
