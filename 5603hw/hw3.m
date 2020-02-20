%hw3_1_b
A = [1 2 3 4 5; 2 4 8 16 32;4 -5 7 -9 11]';
P = A*inv(A'*A)*A';
I2P = eye(5)-2*P;
disp(I2P*I2P');

v = [1 -1 1 -1 1]';
a = P*v
b = v-P*v

%% hw3_2
width = 4; height = 1; 
M = mathword([width,height]);
plot(M(1,:), M(2,:)) 
axis equal 
axis([-2.5 2.5 -.6 .6]) 
box off 
shg 
print -depsc MATH.eps

% a
T1 = [2 1;1 3]; 
[V1,D1] = eig(T1);
V1(:,1) = -V1(:,1);
v1 = V1(:,1);
v2 = V1(:,2);
lambda1 = D1(1,1);
lambda2 = D1(2,2);
C = V1'*M;
n = size(C,2);
M1 = repmat(C(1,:), 2, 1).*repmat(V1(:,1), 1, n); 
M2 = repmat(C(2,:), 2, 1).*repmat(V1(:,2), 1, n); 
disp('M1=')
disp(M1)
disp('M2=')
disp(M2)

%% b
for k = 1:4
   T1kM = T1^k * M;
   L2T1M = lambda2^(-k)*T1^k * M;
   subplot(4,2,2*k-1)
   plot(T1kM(1,:),T1kM(2,:))
   title("T1kM, k = "+ num2str(k))
   subplot(4,2,2*k)
   plot(L2T1M(1,:),L2T1M(2,:))
   title("L2T1M,k = "+num2str(k))
end

%% c
T2 = [2 1;2 -3]; 
[V2,D2] = eig(T2);
V2(:,1) = -V2(:,1);
v1 = V2(:,1);
v2 = V2(:,2);
lambda1 = D2(1,1);
lambda2 = D2(2,2);
C = V2\M;
n = size(C,2);
M1 = repmat(C(1,:), 2, 1).*repmat(V2(:,1), 1, n); 
M2 = repmat(C(2,:), 2, 1).*repmat(V2(:,2), 1, n); 
disp('M1=')
disp(M1)
disp('M2=')
disp(M2)

%% d
for k = 1:4
   T2kM = T2^k * M;
   L2T2M = lambda2^(-k)*T2^k * M;
   subplot(4,2,2*k-1)
   hold on
   plot(T2kM(1,:),T2kM(2,:))
  
   title("T2kM, k = "+ num2str(k))
   subplot(4,2,2*k)
   plot(L2T2M(1,:),L2T2M(2,:))
   title("L2T2M,k = "+num2str(k))
end

%% hw3_3
A = [3 2;4 1];
x1 = rand(1,1e5);
x2 = (1-x1.^4).^(1/4);
norm = max(((3*x1+2*x2).^4+(4*x1+x2).^4).^(1/4));
disp("4-norm of A is " + num2str(norm))



