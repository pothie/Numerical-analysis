% hw4_3
width = 4; height = 1; 
% a
for x = 1:6
    subplot(3,2,x)
    M = mathword2([width,height]);
    p.NFV = [.1, 1e5,1];
    p.translate = [-x,0,4];
    p.phi_rpy = [0,-60,0];
    perspective(p)
    MP = perspective(M);
    plot(MP(1,:),MP(2,:))
    axis([-0.4 0.4 -1 1])
    title(num2str(x)+" unit(s) away from the origin")
end

% b
figure()
plot3(M(1,:),M(2,:),M(3,:))
view([0 0 2])
title("view from (0,0,2)")

% c
p.NFV = [1, 1e5,1];
p.translate = [0,0,2];
p.phi_rpy = [0,-90,0];
perspective(p)
MP = perspective(M);
A = MP'*inv(MP*MP')*MP;
P = A*M';
figure()
plot(P(:,1),P(:,2))
title("Approximation by projection matrix")

