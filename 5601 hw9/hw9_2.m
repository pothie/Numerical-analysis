%9.4-2

%% a
A = [2 3 3 -5;1 2 1 -4;3 -1 10 9;-1 1 -4 -5];
b = [6;3;9;-3];
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

%% b
A = [2 3 3 -5;1 2 1 -4;3 -1 10 10;-1 1 -4 -5];
b = [6;3;9;-3];
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

%% c
A = [2 3 3 -5;1 2 1 -4;3 -1 10 10;-1 1 -4 -5];
b = [6;4;9;-3];
am = [A b];
rref = rref(am);
r = rref(:,length(rref));
u = zeros(length(A));
for i = 1:length(rref)-1
    if ~any(rref(:,i)==1)
       u(:,i) = -1*rref(:,i);
       u(i,i) = 1;
    end
    if all(rref(i,1:length(rref)-1)==0) && r(i) ~= 0
        disp("No solution.")
        break;
    end
end