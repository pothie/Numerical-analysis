%9.4-4
%% a
M = [1 0 0;-1 1 -1;0 2 -2];
b = [1;0;2];
r = [M b];
rref(r)

%% b
M = [4 2 -2;-2 10 -10;-2 -10 10];
b = [2;8;-8];
r = [M b];
rats(rref(r))
