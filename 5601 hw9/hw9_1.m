%9.4-1

%% a
A = [2 -2 4;3 5 2;-1 3 -3];
b = [18;3;-15];
am = [A b];
rref = rref(am);
r = rref(:,length(rref));
u = zeros(length(A));
for i = 1:length(rref)-1
    if ~any(rref(:,i)==1)
       u(:,i) = -1*rref(:,i);
       u(i,i) = 1;
    end
end
if any(any(mod(u,1)~= zeros(length(A))))
    u = u * 2;
end
disp("Solution:");
disp(num2str(u)+"   +   "+rats(r));


%% b
A = [2 -2 4;3 5 2;-1 3 -3];
b = [18;6;-15];
am = [A b];
rref = rref(am);
r = rref(:,length(rref));
u = zeros(length(A));
for i = 1:length(rref)-1
    if ~any(rref(:,i)==1)
       u(:,i) = -1*rref(:,i);
       u(i,i) = 1;
    end
end
if any(any(mod(u,1)~= zeros(length(A))))
    u = u * 2;
end
disp("Solution:");
disp(num2str(u)+"   +   "+rats(r));

%% c
A = [2 -2 4;3 5 2;-3 3 -3];
b = [18;6;-15];
am = [A b];
rref = rref(am);
r = rref(:,length(rref));
u = zeros(length(A));
for i = 1:length(rref)-1
    if ~any(rref(:,i)==1)
       u(:,i) = -1*rref(:,i);
       u(i,i) = 1;
    end
end
disp("Solution:");
disp(num2str(u)+"   +   "+rats(r));


