%hw10_1a
function Eval = hw10_1a(A)
    n = length(A);
    Eval = zeros(n,1);
    for i = 1:n-1
        A = A(1:n-i+1,1:n-i+1);
        mu = A(end,end);
        if mu == 0
            d = A(end-1,end-1)*A(end,end)-A(end,end-1)*A(end-1,end);
            t = A(end-1,end-1)+A(end,end);
            e1 = (t+sqrt(t^2-4*d))/2;
            e2 = (t-sqrt(t^2-4*d))/2;
            if abs(e1)<abs(e2)
                mu = e1;
            else
                mu = e2;
            end
        end

        while abs(A(end,end-1)) > 1e-10
            [Q,R] = qr(A-mu*eye(n-i+1));
            A = R*Q+mu*eye(length(A));
            mu = A(end,end);

            if mu == 0
                d = A(end-1,end-1)*A(end,end)-A(end,end-1)*A(end-1,end);
                t = A(end-1,end-1)+A(end,end);
                e1 = (t+sqrt(t^2-4*d))/2;
                e2 = (t-sqrt(t^2-4*d))/2;
                if abs(e1)<abs(e2)
                    mu = e1;
                else
                    mu = e2;
                end
            end

        end
        Eval(i) = mu;
    end
    Eval(n) = A(1,1);
end
