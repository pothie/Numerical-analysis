%9.4-6
%% a
a = [1;2;3;4];
b = [2;3;4;5];
c = [2;3;5;7];
M = [a b c];
n = zeros(4,1);
s = [M n];
r = rref(s);
if all(r(1:3,1:3) == eye(3))
    disp("a,b,c are linearly independent");
end

%% b
g = zeros(4,5);
while(any(any(g(:,1:4) ~= eye(4))))
    d = 10*rand(4,1);
    M = [a b c d];
    f = [M n];
    g = rref(f);
end
disp("d= ");
disp(d);
disp("a,b,c,d are linearly independent");