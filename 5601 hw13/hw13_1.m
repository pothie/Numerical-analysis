%14.1-4
for i = 1:1
    if i==1
        ep = 0.02;
    else 
        ep = 0.002;
    end
    
    f0= @(x) cos(x);
    f = @(x) cos(x)+ep*sin(x./ep);
    df0 = @(x) -sin(x);
    df = @(x) -sin(x)+cos(x./ep);
    x = linspace(0,2*pi,1e6);

    figure()
    subplot(1,2,1)
    plot(x,f0(x),'b-');
    hold on
    plot(x,f(x),'g:');
    axis equal
    title('f0(x) and f(x)')
    xlabel('x-value')
    ylabel('f-value')
    legend('f0(x)','f(x)')

    subplot(1,2,2)
    plot(x,df0(x),'b-');
    hold on
    plot(x,df(x),'g:');
    axis equal
    title('df0(x) and df(x)')
    xlabel('x-value')
    ylabel('f-value')
    legend('df0(x)','df(x)')
end
