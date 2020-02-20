%14.1-6
for i=1:6
    if i==1 || i==2
        f = @(x) sin(x.^2); 
        fc = 'sin(x^2)';
        fdrv = @(x) 2*x.*cos(x.^2); 
        f2drv = @(x) -4*(x.^2).*sin(x.^2)+2.*cos(x.^2);
    elseif i==3 || i==4
        f = @(x) exp(x.^2+1); 
        fc = 'exp(x^2+1)';
        fdrv = @(x) exp(x.^2+1).*2.*x; 
        f2drv= @(x) exp(x.^2+1).*4.*x.^2 + exp(x.^2+1).*2;
    else
        f = @(x) sin(2.*x)+cos(2.*x); 
        fc = 'sin(2x)+cos(2x)';
        fdrv = @(x) 2*cos(2.*x)-2*sin(2.*x); 
        f2drv= @(x) -4*sin(2.*x)-4*cos(2.*x);
    end
    
    if mod(i,2)==1
        x = 1/3; 
        h0 = 0.1;
    else
        x = 0; 
        h0 = 1; 
    end
    Df = @(x,h) (f(x+h) - f(x))./h; 
    D2c = @(x,h) (f(x+h) - f(x-h))./(2.*h);
    D2f = @(x,h) (-3.*f(x)+4.*f(x+h)-f(x+2.*h))./(2.*h);
    Df2 = @(x,h) (f(x+h)-2*f(x)+f(x-h))./h.^2;
    nr_h = 40; 
    h = h0*2.^(-(0:nr_h)'); 
    A(:,1) = h; 
    A(:,2) = Df(x,h) - fdrv(x); 
    A(:,3) = D2c(x,h) - fdrv(x);
    A(:,4) = D2f(x,h) - fdrv(x);
    A(:,5) = Df2(x,h) - f2drv(x);
    disp('       1st derivative                          2nd derivative')
    disp('       h        err-1f         err-2c       err-2f       error') 
    disp(A) 
    
    figure()
    hold off
    loglog(h,abs(A(:,2)),'-')
    hold on
    loglog(h,abs(A(:,3)),':','MarkerSize',10)
    loglog(h,abs(A(:,4)),'--')
    loglog(h,abs(A(:,5)),'-.')
    axis equal
    legend('1f','2c','2f','2nd derivative')
    title(fc);
    xlabel('h');
    ylabel('error');
end