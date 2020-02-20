%hw8_3
function x = hw8_3b(A,b)
    n = length(b);
    l1 = A(1,n);
    un = A(n,1);
    e1 = zeros(n,1);
    e1(1) = 1;
    en = zeros(n,1);
    en(n) = 1;
    T = A-sparse(1,n,l1,n,n)-sparse(n,1,un,n,n);
    l = l1*e1+en;
    u = un*e1+en;

    Tt = T-sparse(1,1,l1*un,n,n)-sparse(n,n,1,n,n);
    y = Tt\b;
    z = Tt\l;
    x = y-((u'*y)/(1+u'*z))*z;
end



