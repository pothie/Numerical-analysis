function Qw = hw5_3c(A,w)
    [m,n] = size(A);
    C = flip(hw5_3b(A));

    for i = 1:n
        v = C{i};
        gamma = v(1);
        v(1) = 1;
        k=length(v);
        w(end-k+1:m,1) = w(end-k+1:m,1) - gamma*(v*v')*w(end-k+1:m,1);
    end

    Qw =w;
end
