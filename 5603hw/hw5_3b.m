function C = hw5_3b(A)
    [m,n] = size(A);
    C = cell(n,1);
    
    for i=1:n
        z = A(i:end,i);
        v = z + sign0(z(1))*norm(z)*eye(length(z),1);
        v = v/v(1);
        Ht = eye(length((v)))-2/(v'*v)*(v*v');
        H = eye(m);
        H(i:end,i:end) = Ht;
        A = H*A;
        v(1) = 2/(v'*v);
        C{i} = v; 
    end
end
