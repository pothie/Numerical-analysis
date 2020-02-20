%13.1-10
q1=poly(1:20)';
q2=poly(2.^(0:-1:-19))';
disp("Coefficients of 13.2a          "+"Coefficients of 13.2b")
disp([q1 q2])

r1=roots(q1);
r2=roots(q2);
disp("  roots of q1  roots of q2")
disp([r1 r2])

disp("  error")
disp([r1./flip(1:20)'-1 r2./2.^(0:-1:-19)'-1])