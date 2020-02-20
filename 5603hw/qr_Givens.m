function [Q,R] = qr_Givens(A)
    n = length(A);
    Q = eye(n);
    for i = 1:n-1
        wi = A(i,i);
        wj = A(i+1,i);
        s = wj/sqrt(wi^2+wj^2);
        c = wi/sqrt(wi^2+wj^2);
    
        G = [c s;-s c];
        A(i:i+1,i:n) = G*A(i:i+1,i:n);
        Q(1:i+1,i:i+1) = Q(1:i+1,i:i+1)*G';
    end
    R = A;
end
        