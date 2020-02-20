%hw9_1
err = ones(10,1);
for i = 1:10
    n = 5e2;
    A = rand(n);
    A = A'*A;
    [~,D] = eig(A);
    e1 = sort(diag(D));
    for k=1:n-2
        z = A(k+1:n,k);
        v = z+sign0(z(1))*norm(z)*eye(length(z),1);

        b = 2/(v'*v);
        p = b*A(k+1:n,k+1:n)*v;
        w = p-b/2*p'*v*v;
        pk = eye(n-k,1)'-b*v(1)*v';
        A(k+1,k) = pk*A(k+1:end,k);
        A(k+2:end,k) = 0;
        A(k,k+1:end) = A(k+1:end,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-v*w'-w*v';
    end
    [~,D] = eig(A);
    e2 = sort(diag(D));
    err(i) =  norm(e1-e2);
end
table((1:10)',err)
