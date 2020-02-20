% hw11_1b
it = 1e2;
Eval1 = zeros(it,1);
Eval2 = zeros(it,1);
n = 5;
for i=1:5
    A = rand(n);
    [~,D] = eig(A);
    while abs(imag(diag(D)))<1e-10
        A = rand(n);
    end
    Eval1 = hw11_1single(A);
    Eval2 = hw11_1_2b2(A);
end
histogram(Eval1);
title("single shifting")
figure()
histogram(Eval2);
title("double shifting")
