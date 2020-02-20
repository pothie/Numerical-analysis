%15.1-7
ode = {@ode45, @ode23, @ode113, @ode15s, @ode23s, @ode23t, @ode23tb};
func = @(t,y) -200*t.*y.^2; 
y_exact = @(t) 1./(1+100.*t.^2);

for j=1:4
    if j==1
        tspan = [-3,0];
        disp(['[' num2str(tspan) ']']);
    elseif j==2
        tspan = [0,3];
        disp(['[' num2str(tspan) ']']);
    elseif j==3
        tspan = [-10,0];
        disp(['[' num2str(tspan) ']']);
    else
        tspan = [0,10];
        disp(['[' num2str(tspan) ']']);
    end
    y_ic = y_exact(tspan(1));
    
    for i=1:7
        [t,y] = ode{i}(func,tspan,y_ic);
        abserr = y(end) - y_exact(t(end));
        disp(ode{i})
        if abs(abserr) > 1e-6
            disp('does not work.')
        else
            disp(['works. absolute error: ' num2str(abserr)])
        end
    end
end