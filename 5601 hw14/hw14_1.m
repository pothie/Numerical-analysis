%14.2-2
for i = 1:4
    a = 0;
    b = 1;
    if i==1
        f = @(x) sin(x).^2;
        int_f = @(x) (2.*x-sin(2*x))./4;
        exact = int_f(b)-int_f(a);
        disp('f=sin(x).^2');
    elseif i==2
        f = @(x) exp(sin(x).^2);
        exact = 1.34732744303297411916;
        disp('f=exp(sin(x).^2)');
    elseif i==3
        f = @(x) sin(2*pi*x).^2;
        int_f = @(x) (4*pi*x-sin(4*pi*x))./(8*pi);
        exact = int_f(b)-int_f(a);
        disp('f=sin(2*pi*x).^2')
    else
        f = @(x) exp(sin(2*pi*x).^2);
        exact = 1.75338765437709039572;
        disp('f=exp(sin(2*pi*x).^2)')
    end
    
    nr_nodes_init = 11; 
    nr_h = 5;
    for i = 1:nr_h 
        nr_nodes = (nr_nodes_init - 1)*2^(i - 1) + 1; 
        x = linspace(a, b, nr_nodes)'; 
        h = x(2) - x(1); 
        c = ones(nr_nodes, 1); 
        c(1) = .5; c(end) = .5;
        int_tra = sum((f(x(1:end-1))+f(x(2:end))))./2.*h;
        int_mid = sum(f(((x(1:end-1))+x(2:end))./2)).*h;
        int_sim = sum((f(x(1:end-1))+...
        4*f(((x(1:end-1))+x(2:end))./2)+f(x(2:end))))./6.*h; 
        M(i,1) = h;
        M(i,2) = int_tra- exact; 
        M(i,3) = int_mid - exact;
        M(i,4) = int_sim - exact;
    end 
    disp(' h    trapezoidal    midpoints   simpsons')
    disp(M)
end