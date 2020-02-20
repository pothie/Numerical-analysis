%15.2-7
 y_ic = [2,-1];
 tspan = [0,100];
for j =1:2
    if j==2
        tspan = [0,1000];
        options = odeset('RelTol',1e-8,'AbsTol',1e-8);
    end

    for i = 1:3
        if i==1
            alpha = 0.1;
        elseif i==2
            alpha = 0.2;
        else
            alpha = 0.25;
        end

        f = @(t,y) [y(2);-alpha*y(2)^2-y(1)+exp(-t)];
        figure()
        subplot(3,2,[1,2]);
        ode45(f,tspan,y_ic)
        [t,Y] = ode45(f,tspan,y_ic);
        subplot(3,2,3);
        plot(t, Y(:,1));
        xlabel('t')
        ylabel('y1')
        subplot(3,2,4);
        plot(Y(:,1), Y(:,2));
        xlabel('y1')
        ylabel('y2')
        subplot(3,2,[5,6]);
        f_en = 1/2*Y(:,1).^2+1/2*Y(:,2).^2;
        plot(t,f_en)
        title('Energy function')
        xlabel('t')
    end
end
