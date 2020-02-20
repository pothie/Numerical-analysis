%9.4-3
A = [1 3 -3 2 -3;3 9 -10 10 -14;2 6 -10 21 -25];
b = [-4;2;53];
am = [A b];
rref = rref(am);
[m,n] = size(A);
u = zeros(m,n);
r = zeros(n,1);
for i = 1:n
    if ~any(rref(:,i)==1)
       u(~isnan(u(:,i)),i) = -1*rref(:,i);
       if i == 1
           u = [zeros(1,n);u(1:end,:)];
       elseif i == n
           u = [u(1:end,:);zeros(1,n)];
       else
           u = [u(1:i,:);zeros(1,n);u(i+1:end,:)];
       end
       u(i,:) = NaN;
       u(i,i) = 1;
       r(i) = NaN;
    end
end
u(isnan(u)) = 0;
r(~isnan(r)) = rref(:,n+1);
r(isnan(r)) = 0;
disp("Solution:");
disp(num2str(u)+"   +   "+num2str(r));
