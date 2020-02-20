% hw8_1
function [Da,wdmag] = hw8_1a(n)
    A = randn(n);
    [V,D] = eig(A);
    d = diag(D);
    values = d(abs(imag(d))<1e-14);
    vectors = V(:,abs(imag(d))<1e-14);
    lambda = values(1);
    v = vectors(:,1);

    b = rand(n,1);
    I = eye(n);
    w = (A-lambda*I)\b;
    uw = w/norm(w);

    p = rand(n,1);
    C = (A-lambda*I)+b*p';
    xi = C\b;
    wd = xi/(1-p'*xi);
    
    Da = acos(uw'*wd/norm(wd));
    wdmag = norm(wd);
end