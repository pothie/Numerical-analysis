%9.4-15
%% a
S = [1 2 4;2 1 -2]';
W = [3 2 2;4 5 6]';
rref(S)
rref(W)

%% b
a =[2 1 -1];
if sum(a*S) == 0
    disp("a is perpendicular to S.")
else
    disp("a is not perpendicular to S.")
end

%% c
b = [2 3 5]';
o = rref([S' zeros(2,1)]);
o = o(:,3); 
o = [-1*o;1];
rats(o)
N = [S o b];
rats(rref(N))

