%12.9-9
%% a
%paper_figure();
hold off
theta = [50.42 63.03 81.36 101.41 122.61];
r = [3.00 2.30 1.65 1.25 1.01];
A = [(r.*cosd(theta)); ones(1,5)]';
a = linsolve(A,r');
e = a(1,1);
b = a(2,1);
disp("    e   "+"         beta")
disp(rats([e b]))
t = linspace(0,2*pi,1e6);
%polarplot(t,b./(1-e*cos(t)))
pr = b./(1-e*cos(t));
plot(pr.*cos(t),pr.*sin(t))
hold on
for i = 1:length(r)
    %polarplot(deg2rad(theta(i)),r(i),'*');
    plot(r(i)*cos(theta(i)),r(i)*sin(theta(i)),'*')
end

%% i 
paper_figure()
hold off
for i=1:100
    ri = r+0.01*randn();
    A1 = [(ri.*cosd(theta)); ones(1,5)]';
    a1 = linsolve(A1,ri');
    e1= a1(1,1);
    b1 = a1(2,1);
    t = linspace(0,2*pi,1e6);
    polarplot(t,b1./(1-e1*cos(t)))
    hold on
end
title('r=r+t')
hold off

%% ii
paper_figure()
for i=1:100
    ri= r*(1+0.01*randn());
    A2 = [(ri.*cosd(theta)); ones(1,5)]';
    a2 = linsolve(A2,ri');
    e2= a2(1,1);
    b2 = a2(2,1);
    t = linspace(0,2*pi,1e6);
    polarplot(t,b2./(1-e2*cos(t)))
    hold on
end
title('r=r(1+t)')
hold off