%12.2-2
paper_figure()
%% a
f = @(x) exp(1).^x./(1-x+2*x.^2);
a = 0;
b = 5;
ndp = 2.^(2:6)+1;
npt_for_norm = 100001;
disp("            n" +"     spline"+ "        pchip");
for i = 1:length(ndp)
    xdp = linspace(a,b,ndp(i));
    x = linspace(a,b,npt_for_norm);
    pps = interp1(xdp,f(xdp),'spline','pp');
    ppp = interp1(xdp,f(xdp),'pchip','pp');
    disp([ndp(i) norm(f(x)-ppval(pps,x),inf) norm(f(x)-ppval(ppp,x),inf)])
    
    subplot(5,2,2*i-1)
    hold on
    plot(x,f(x),"r-")
    plot(xdp,ppval(pps,xdp),"b-")
    title("n = "+num2str(2*i-1)+", spline");

    subplot(5,2,2*i)
    hold on
    plot(x,f(x),"r-")
    plot(xdp,ppval(ppp,xdp),"b-")
    title("n = "+num2str(2*i)+", pchip");
end

%% b
hold off
f = @(x) 1./(1+25*x.^2);
a = -1;
b = 1;
ndp = 2.^(2:6)+1;
npt_for_norm = 100001;

disp("             n" +"       spline"+ "        pchip");
for i = 1:length(ndp)
    xdp = linspace(a,b,ndp(i));
    x = linspace(a,b,npt_for_norm);
    pps = interp1(xdp,f(xdp),'spline','pp');
    ppp = interp1(xdp,f(xdp),'pchip','pp');
    disp([ndp(i) norm(f(x)-ppval(pps,x),inf) norm(f(x)-ppval(ppp,x),inf)])
      
    subplot(5,2,2*i-1)
    hold on
    plot(x,f(x),"r-")
    plot(xdp,ppval(pps,xdp),"b-")
    title("n = "+num2str(2*i-1)+", spline");

    subplot(5,2,2*i)
    hold on
    plot(x,f(x),"r-")
    plot(xdp,ppval(ppp,xdp),"b-")
    title("n = "+num2str(2*i)+", pchip");
end


