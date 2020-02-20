% hw11_1a
it = 1e3;
Eval1 = zeros(it,1);
Eval2 = zeros(it,1);
n = 10;
for i=1:it
    A = rand(n);
    A = A'*A;
    Eval1(i) = hw11_1single(A);
    Eval2(i) = hw11_1_2b2(A);
end
histogram(Eval1);
title("single shifting")
figure()
histogram(Eval2);
title("double shifting")

