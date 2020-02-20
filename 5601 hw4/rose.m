%6.8-11
function rose(k)
    if length(k) == 1
        k1 = k;
        k2 = 1;
    elseif length(k) ==2
        k1 = k(1);
        k2 = k(2);
    else
        disp("We need one or two inputs."); 
    end
    theta = linspace(0,k2*2*pi,1000000);
    f = @(x) cos(k1/k2.*x);
    polar(theta,f(theta),"r-")
    title("k1="+k1+",k2="+k2)
    axis equal
end