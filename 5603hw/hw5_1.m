% hw5_1
%% a
for i=2:20
    H = hilb(i);
    [GQ,GR] =gs(H);
    [MGQ,MGR] = mgs(H);
    [HQ,HR] = qr(H); 
    gqerror(i-1) = norm(GQ'*GQ-eye(i),1);
    mgqerror(i-1) = norm(MGQ'*MGQ-eye(i),1);
    herror(i-1) = norm(HQ'*HQ-eye(i),1);
    con(i-1) = cond(H,1);
end
disp(["n" "G-error" "MG-error" "H-error" "cond"])
disp([(2:20)' gqerror' mgqerror' herror' con'])

          "n"    "G-error"    "MG-error"    "H-error"    "cond"
            2   1.8648e-15   1.8648e-15   4.0117e-16           27
            3    7.085e-14   1.0117e-14   3.6877e-16          748
            4   3.5109e-11   3.8466e-13   7.0517e-16        28375
            5   1.0385e-07   2.4634e-12   7.1071e-16   9.4366e+05
            6   2.1696e-05   7.1001e-10   1.2949e-15    2.907e+07
            7     0.087551   1.2188e-08   8.6073e-16   9.8519e+08
            8       1.0404   2.7388e-07   1.2162e-15   3.3873e+10
            9       2.0925   2.8715e-06   1.6294e-15   1.0996e+12
           10       3.0185   0.00022224   1.0371e-15   3.5353e+13
           11        4.023    0.0031238    1.812e-15   1.2305e+15
           12       5.0062       0.1854   1.4156e-15   3.9202e+16
           13       6.0189       1.3901   2.1071e-15   8.5317e+17
           14       7.0277       1.3428   1.6043e-15   1.6747e+18
           15       8.0247       1.3864   2.1757e-15   1.0936e+18
           16       8.9981       1.2716   2.5762e-15   1.4601e+18
           17       9.6126       1.7865   1.8305e-15   1.8768e+18
           18       10.253       1.5826   1.6478e-15   3.9866e+18
           19       11.942       2.1522   2.3366e-15    1.484e+18
           20       12.997       2.2321   2.3242e-15   7.9212e+18

%% b 
n = 1e3;
A = rand(n);
[GQ,GR] =gs(A);
[MGQ,MGR] = mgs(A);
[HQ,HR] = qr(A); 
gqerrorA = norm(GQ'*GQ-eye(n),1);
mgqerrorA = norm(MGQ'*MGQ-eye(n),1);
herrorA = norm(HQ'*HQ-eye(n),1);
conA = cond(A,1);
disp(["G-error" "MG-error" "H-error" "cond"])
disp([ gqerrorA' mgqerrorA' herrorA' conA'])

% b
    "G-error"    "MG-error"    "H-error"    "cond"
   6.4387e-10   6.5637e-12   4.4225e-14   1.4549e+05

%% c
B = A;
B(:,end) = sum(B(:,1:end-1)')';
[GQ,GR] =gs(B);
[MGQ,MGR] = mgs(B);
[HQ,HR] = qr(B); 
gqerrorB = norm(GQ'*GQ-eye(n),1);
mgqerrorB = norm(MGQ'*MGQ-eye(n),1);
herrorB = norm(HQ'*HQ-eye(n),1);
conB = cond(B,1);
disp(["G-error" "MG-error" "H-error" "cond"])
disp([ gqerrorB' mgqerrorB' herrorB' conB'])

% c
    "G-error"    "MG-error"    "H-error"    "cond"
       5.4452       5.5358   4.4225e-14   1.2152e+20


