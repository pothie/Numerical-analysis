%hw8_4
function R1 = hw8_4(R,x)
    n = length(x);
    R(n+1,:) = x';
    n = length(x);
    for i = 1:n
        Givens = eye(n+1,n+1);
        wi = R(i,i);
        wj = R(i+1,i);
        s = wj/sqrt(wi^2+wj^2);
        c = wi/sqrt(wi^2+wj^2);
        Givens(i,i) = c;
        Givens(n+1,n+1) = c;
        Givens(n+1,i) = -s;
        Givens(i,n+1) = s;
        R = Givens*R;
    end
    R1 = R(1:n,:);
end
