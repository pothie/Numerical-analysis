% hw 5 problem 3
function [Q,R] = householder(A)
    [m,n] = size(A);
    Q = eye(m);
    for i=1:n
        z = A(i:end,i);
        v = z + sign0(z(1))*norm(z)*eye(length(z),1);
        Ht = eye(length((v)))-2/(v'*v)*(v*v');
        H = eye(m);
        H(i:end,i:end) = Ht;
        Q = Q*H;
        A = H*A;
    end
    R = A;
end