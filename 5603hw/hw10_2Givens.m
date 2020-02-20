% hw10_2
function y = hw10_2Givens(A)
    n = length(A);
    B = hess(A);
    tol = 1e-13;
    p = n;

    while p > 2
        m = p-1;
        s = B(m,m)+B(p,p);
        t = B(m,m)*B(p,p)-B(m,p)*B(p,m);
        x = B(1,1)*B(1,1)+B(1,2)*B(2,1)-s*B(1,1)+t;
        y = B(2,1)*(B(1,1)+B(2,2)-s);
        z = B(2,1)*B(3,2);

        for k = 0:p-3
            v = [x y z]'+sign0(x)*norm([x y z]')*eye(3,1);
            H = eye(3)-2/(v'*v)*(v*v');
            q = max(1,k);
            B(k+1:k+3,q:n) = H*B(k+1:k+3,q:n);
            r = min(k+4,p);
            B(1:r,k+1:k+3) = B(1:r,k+1:k+3)*H;
            x = B(k+2,k+1);
            y = B(k+3,k+1);
            if k<p-3
                z = B(k+4,k+1);
            end
        end

        wi = x;
        wj = y;
        s = wj/sqrt(wi^2+wj^2);
        c = wi/sqrt(wi^2+wj^2);
        G = [c s;-s c];
        B(m:p,p-2:end) = G*B(m:p,p-2:end);
        B(1:p,p-1:p) = B(1:p,p-1:p)*G';

        if norm(B(p,m))<tol
            B(p,m) = 0;
            p = p-1;
        elseif norm(B(p-1,m-1))<tol
            B(p-1,m-1) = 0;
            p = p-2;
        end
    end

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
