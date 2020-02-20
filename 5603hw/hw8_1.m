% hw8_1
% a
format short g 
n = 5
A = randn(n)
[V,D] = eig(A)
d = diag(D)
values = d(abs(imag(d))<1e-14)
vectors = V(:,abs(imag(d))<1e-14)
lambda = values(1)
v = vectors(:,1)

b = rand(n,1)
I = eye(n);
w = (A-lambda*I)\b
uw = w/norm(w)

p = rand(n,1)
C = (A-lambda*I)+b*p'
xi = C\b
wd = xi/(1-p'*xi)
uwd = wd/norm(wd)

disp("Difference of direction")
Dd = norm(uwd-uw)
disp("Difference of magnitude")
Dm = abs((norm(uw)-norm(wd)))


% c
Diff_of_angles = ones(10,1);
w_mag = Diff_of_angles;
n = 1000;
for i=1:10
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
    
    Diff_of_angles(i) = acos(uw'*wd/norm(wd));
    w_mag(i) = norm(wd);
end
Index = (1:10)';
table(Index,Diff_of_angles,w_mag)