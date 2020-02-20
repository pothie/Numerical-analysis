% 10.1-10 (c)
Xe = [];
Ye = [];
Ze = [];
X = [];
Y = [];
Z = [];

for i= 1:600
    n = 200;
    A = rand(n);
    x = rand(n,1);
    b = A*x;
    Xe(i) = norm(x-nop(A,b));
    X(i) = log10(abs(Xe(i)));
    Ye(i) = norm(x-partialp(A,b));
    Y(i) = log10(abs(Ye(i)));
    Ze(i) = norm(x-fullp(A,b));
    Z(i) = log10(abs(Ze(i)));
end
figure(1)
histogram(X,"Normalization","pdf");
title("No pivoting")

figure(2)
histogram(Y,"Normalization","pdf");
title("Partial pivoting")

figure(3)
histogram(Z,"Normalization","pdf");
title("Full pivoting")

disp('Original Data');
disp(['mean  '  num2str(mean(Xe)) '   ' num2str(mean(Ye))...
        '   ' num2str(mean(Ze))]);
disp(['standard deviation   ' num2str(std(Xe)) '    ' ...
    num2str(std(Ye)) '   ' num2str(std(Ze))]);
disp('Logarithmic Data');
disp(['mean  '  num2str(mean(X)) '     ' num2str(mean(Y))...
        '     ' num2str(mean(Z))]);
disp(['standard deviation   ' num2str(std(X)) '   '...
    num2str(std(Y)) '   ' num2str(std(Z))]);