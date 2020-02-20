%12.1-3
function np = hw7_3(q,s)
    np(1) = polyval(q,s);
    dq = q;
    for i = 2:length(q)
        dq = polyder(dq);
        np(i) = polyval(dq,s)/factorial(i-1);
    end
    np = flip(np);
end