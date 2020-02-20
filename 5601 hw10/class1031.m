%zeros and minimum of f and ph
f = @(x) sin(3*x.^2-1)+log(abs(x));
[x,fx] = fzero(f,1)
g = @(x) exp(x);
fzero(g,0) %smallest possible number in matlab is 10^-235