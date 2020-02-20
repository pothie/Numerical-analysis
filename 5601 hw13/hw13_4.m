%14.1-10
nr_h = 20; 
h = 2.^(-(0:nr_h)'); 
A(:,1) = h;
for i = 1:9
    if mod(i,3)==1
        x=0;
    elseif mod(i,3)==2
        x=0.1;
    else
        x=0.01;
    end
    
    if i<=3
        n=0;
    elseif i<=6
        n=1;
    else
        n=2;
    end
    
    f = @(x) abs(x).^(n+1/2).*cos(x);
    df = @(x) (n+1/2).*x.*cos(x).*abs(x).^(n-3/2)...
                -sin(x).*abs(x).^(n+1/2);
    Df = @(x,h) (f(x+h) - f(x))./h; 
    D2c = @(x,h) (f(x+h) - f(x-h))./(2.*h);
   
    if mod(i,3) == 0
        A(:,6) = Df(x,h) - df(x); 
        A(:,7) = D2c(x,h) - df(x);
        disp('            h          err-1f       err-2c      err-1f      err-2c      err-1f       err-2c'); 
        disp(A); 
        A = [];
        A(:,1) = h;
    else
        A(:,2*mod(i,3)) = Df(x,h) - df(x); 
        A(:,2*mod(i,3)+1) = D2c(x,h) - df(x);
    end
end