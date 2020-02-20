%hw11_1a
% Based on hw10 problem a
% Shifting the bottom right element
function count = hw11_1single(A)
    n = length(A);
    count = 0;
    
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

        while abs(A(end,end-1)) > 1e-16
            % Modified this function to use householder 
            B = A-mu*eye(n-i+1); 
            m = size(B);
            Q = eye(m);
            for j=1:m
                z = B(j:end,j);
                v = z + sign0(z(1))*norm(z)*eye(length(z),1);
                Ht = eye(length((v)))-2/(v'*v)*(v*v');
                H = eye(m);
                H(j:end,j:end) = Ht;
                Q = Q*H;
                B = H*B;
            end
            R = B;
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
            count = count+1;
        end
        %Eval(i) = mu;
    end
    %Eval(n) = A(1,1);
end
