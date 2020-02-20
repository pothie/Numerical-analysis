%12.6-3
A = [2 3 5 7;11 13 17 19;23 29 31 37;41 43 47 53];
n = length(A);

z = A(:,1);
v = z+sign0(z(1))*norm(z)*eye(length(z),1);
H1 = eye(length(v)) - (2/(v'*v))*(v*v');

A1 = H1*A;
z = A1(2:end,2);
v = z+sign0(z(1))*norm(z)*eye(length(z),1);
H2t = eye(length(v)) - (2/(v'*v))*(v*v');
H2 = eye(n);
H2(2:n,2:n) = H2t;

A2 = H2*H1*A;
z = A2(3:end,3);
v = z+sign0(z(1))*norm(z)*eye(length(z),1);
H3t = eye(length(v)) - (2/(v'*v))*(v*v');
H3 = eye(n);
H3(3:n,3:n) = H3t;

R = H3*H2*H1*A
Q = H1*H2*H3

