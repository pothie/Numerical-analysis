function pnx = mylegendre(n, x) % (1)
% input: n = degree of Legendre polynomial
% x = evaluate it at these points
% output: pnx = P_n(x)
pkm1 = ones(size(x)); 
pk = x; 
if n == 0 
    pnx = pkm1; 
    return
elseif n == 1
    pnx = pk;
    return 
end 
for k = 1:n-1 
    pkp1 = ( (2*k + 1)*x.*pk - k*pkm1 )/(k + 1); 
    pkm1 = pk; 
    pk = pkp1; 
end 
    pnx = pkp1; 
end