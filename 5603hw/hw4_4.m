%hw4_4
%% i
paper_figure()
hold off
X = [0 0 0 0 1 1 1 1 0 0 0 0
0 0 0 0 1 1 1 1 1 1 1 1]; 
Y = [0 1 1 0 0 1 1 0 0 1 1 0
1 1 0 0 1 1 0 0 0 1 1 0]; 
Z = [0 0 1 1 0 0 1 1 0 0 1 1
0 1 1 0 0 1 1 0 0 0 1 1];
plot3(X, Y, Z, 'b');
hold on
camproj('perspective')
camproj('orthographic')
set(gca, 'Projection', 'perspective') 
set(gca, 'CameraPosition', [4 3 2])

p.NFV = [.1, 1e5,1];
p.translate = [1e3,1,1];
p.phi_rpy = [0,-90,0];
perspective(p)
C = [X Y Z];
C(3,:) = zeros(1,36);
[CP1,~] = perspective(C);

p.NFV = [.1, 1e5,1];
p.translate = [0,-1e3,1];
p.phi_rpy = [0,-90,0];
perspective(p)
[CP2,~] = perspective(C);

P(1,:) = CP1(:,end);
P(2,:) = CP2(:,end);
P(3,:) = zeros(1,2);
plot3(P(1,:),P(2,:),P(3,:))
xlabel('x')
ylabel('y')

XN = X+2;
YN = Y-5;
ZN = Z-1;
hold on
plot3(XN,YN,ZN,'r')
axis equal
set(gca,'visible','off')

%% ii
paper_figure()
hold off
X = [0 0 0 0 1 1 1 1 0 0 0 0
0 0 0 0 1 1 1 1 1 1 1 1]; 
Y = [0 1 1 0 0 1 1 0 0 1 1 0
1 1 0 0 1 1 0 0 0 1 1 0]; 
Z = [0 0 1 1 0 0 1 1 0 0 1 1
0 1 1 0 0 1 1 0 0 0 1 1];
plot3(X, Y, Z, 'b');
hold on
camproj('perspective')
camproj('orthographic')
set(gca, 'Projection', 'perspective') 
set(gca, 'CameraPosition', [4 3 2])

p.NFV = [.1, 1e5,1];
p.translate = [1e3,1,1];
p.phi_rpy = [0,-90,0];
perspective(p)
C = [X Y Z];
C(3,:) = zeros(1,36);
[CP1,~] = perspective(C);

p.NFV = [.1, 1e5,1];
p.translate = [0,-1e3,1];
p.phi_rpy = [0,-90,0];
perspective(p)
[CP2,~] = perspective(C);

P(1,:) = CP1(:,end);
P(2,:) = CP2(:,end);
P(3,:) = zeros(1,2);
hold on
plot3(P(1,:),P(2,:),P(3,:))
xlabel('x')
ylabel('y')
plot3([1 P(1,1)],[1 P(1,2)], [1 0],'k:')
plot3([1 P(1,1)],[1 P(1,2)], [0 1],'k:')
plot3([0 P(1,1)],[1 P(1,2)], [1 0],'k:')
plot3([0 P(1,1)],[1 P(1,2)], [0 1],'k:')

plot3([1 P(2,1)],[1 P(2,2)], [1 0],'k:')
plot3([1 P(2,1)],[1 P(2,2)], [0 1],'k:')
plot3([1 P(2,1)],[0 P(2,2)], [1 0],'k:')
plot3([1 P(2,1)],[0 P(2,2)], [0 1],'k:')

XN = X+2;
YN = Y-5;
ZN = Z-1;
hold on
plot3(XN,YN,ZN,'r')
axis equal
set(gca,'visible','off')

%% iii
paper_figure()
hold off
X = [0 0 0 0 1 1 1 1 0 0 0 0
0 0 0 0 1 1 1 1 1 1 1 1]; 
Y = [0 1 1 0 0 1 1 0 0 1 1 0
1 1 0 0 1 1 0 0 0 1 1 0]; 
Z = [0 0 1 1 0 0 1 1 0 0 1 1
0 1 1 0 0 1 1 0 0 0 1 1];
plot3(X, Y, Z, 'b');
hold on
camproj('perspective')
camproj('orthographic')
set(gca, 'Projection', 'perspective') 
set(gca, 'CameraPosition', [4 3 2])

p.NFV = [.1, 1e5,1];
p.translate = [1e3,1,1];
p.phi_rpy = [0,-90,0];
perspective(p)
C = [X Y Z];
C(3,:) = zeros(1,36);
[CP1,~] = perspective(C);

p.NFV = [.1, 1e5,1];
p.translate = [0,-1e3,1];
p.phi_rpy = [0,-90,0];
perspective(p)
[CP2,~] = perspective(C);

P(1,:) = CP1(:,end);
P(2,:) = CP2(:,end);
P(3,:) = zeros(1,2);
hold on
plot3(P(1,:),P(2,:),P(3,:))
xlabel('x')
ylabel('y')
plot3([1 P(1,1)],[1 P(1,2)], [1 0],'k:')
plot3([1 P(1,1)],[1 P(1,2)], [0 1],'k:')
plot3([0 P(1,1)],[1 P(1,2)], [1 0],'k:')
plot3([0 P(1,1)],[1 P(1,2)], [0 1],'k:')

plot3([1 P(2,1)],[1 P(2,2)], [1 0],'k:')
plot3([1 P(2,1)],[1 P(2,2)], [0 1],'k:')
plot3([1 P(2,1)],[0 P(2,2)], [1 0],'k:')
plot3([1 P(2,1)],[0 P(2,2)], [0 1],'k:')

XN = X+2;
YN = Y-5;
ZN = Z-1;
hold on
plot3(XN,YN,ZN,'r')
axis equal
set(gca,'visible','off')

% Add dashed lines on the second cube
plot3([2 P(1,1)],[-4 P(1,2)], [-1 0],'r:')
plot3([3 P(1,1)],[-4 P(1,2)], [-1 1],'r:')
plot3([2 P(1,1)],[-4 P(1,2)], [0 0],'r:')
plot3([3 P(1,1)],[-4 P(1,2)], [0 1],'r:')

plot3([3 P(2,1)],[-5 P(2,2)], [-1 0],'r:')
plot3([3 P(2,1)],[-4 P(2,2)], [-1 1],'r:')
plot3([3 P(2,1)],[-5 P(2,2)], [0 0],'r:')
plot3([3 P(2,1)],[-4 P(2,2)], [0 1],'r:')

%% b
paper_figure()
hold off
X = [0 0 0 0 1 1 1 1 0 0 0 0
0 0 0 0 1 1 1 1 1 1 1 1]; 
Y = [0 1 1 0 0 1 1 0 0 1 1 0
1 1 0 0 1 1 0 0 0 1 1 0]; 
Z = [0 0 1 1 0 0 1 1 0 0 1 1
0 1 1 0 0 1 1 0 0 0 1 1];
plot3(X, Y, Z, 'b');
hold on
camproj('perspective')
camproj('orthographic')
set(gca, 'Projection', 'perspective') % (18)
set(gca, 'CameraPosition', [4 3 2])

p.NFV = [.1, 1e5,1];
p.translate = [1e3,1,1];
p.phi_rpy = [0,-90,0];
perspective(p)
C = [X Y Z];
C(3,:) = zeros(1,36);
[CP1,~] = perspective(C);

p.NFV = [.1, 1e5,1];
p.translate = [0,-1e3,1];
p.phi_rpy = [0,-90,0];
perspective(p)
[CP2,~] = perspective(C);

P(1,:) = CP1(:,end);
P(2,:) = CP2(:,end);
P(3,:) = zeros(1,2);
plot3(P(1,:),P(2,:),P(3,:))
xlabel('x')
ylabel('y')
plot3([1 P(1,1)],[1 P(1,2)], [1 0],'k:')
plot3([1 P(1,1)],[1 P(1,2)], [0 1],'k:')
plot3([0 P(1,1)],[1 P(1,2)], [1 0],'k:')
plot3([0 P(1,1)],[1 P(1,2)], [0 1],'k:')

plot3([1 P(2,1)],[1 P(2,2)], [1 0],'k:')
plot3([1 P(2,1)],[1 P(2,2)], [0 1],'k:')
plot3([1 P(2,1)],[0 P(2,2)], [1 0],'k:')
plot3([1 P(2,1)],[0 P(2,2)], [0 1],'k:')

XN = X+2;
YN = Y-2;
ZN = Z;
hold on
plot3(XN,YN,ZN,'r')
axis equal
set(gca,'visible','off')

plot3([2 P(1,1)],[-1 P(1,2)], [0 0],'r:')
plot3([3 P(1,1)],[-1 P(1,2)], [0 1],'r:')
plot3([2 P(1,1)],[-1 P(1,2)], [1 0],'r:')
plot3([3 P(1,1)],[-1 P(1,2)], [1 1],'r:')

plot3([3 P(2,1)],[-2 P(2,2)], [0 0],'r:')
plot3([3 P(2,1)],[-1 P(2,2)], [0 1],'r:')
plot3([3 P(2,1)],[-2 P(2,2)], [1 0],'r:')
plot3([3 P(2,1)],[-1 P(2,2)], [1 1],'r:')

