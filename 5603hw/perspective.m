function [Points_view_plane, pseudo_dist] = ...
   perspective(structure_or_points)
%  carries out 3D perspective projection                                                                         
%  the first call inputs the parameters
%  all remaining calls input the points
%  warning messages are printed out if points lie in front of the near
%  plane or behind the far plane
%%%  input (only one argument):                                                                                                      
%  structure_or_points = 
%    persp_params = a struct containing all the parameters needed                                                  
%                .NFV - a three-vector containing N, F, V                                                          
%                .translate - a three-vector of the location of the observer                                       
%                .phi_rpy - a three-vector of the roll, pitch, and yaw angles                                      
%  *** OR ***
%    Points = the 3D points as a  3 x ?  matrix
%%%  output:                                                                                                     
%  Points_view_plane = a 2x? matrix of the projection                                                            
%  pseudo_dist = the pseudo-distance for each point
  persistent a b P R T
  if isstruct(structure_or_points)
    persp_params = structure_or_points;
    N = persp_params.NFV(1);
    F = persp_params.NFV(2);    
    V = persp_params.NFV(3);
    t = persp_params.translate;
    phi_rpy = persp_params.phi_rpy;
    a = (F + N)/(F - N);
    b = 2*F*N/(F - N);
    P = [-V 0 0 0
         0 -V 0 0
         0 0 a b
         0 0 1 0];
    T = eye(4);
    T([1:3],4) = -t;
    R = eye(4);
    R(1:3,1:3) = [0 -1  0
                  0  0  1
                  -1 0 0];
    R(1:3,1:3) = R(1:3,1:3)*rot3('x', -phi_rpy(1))*...
        rot3('y', phi_rpy(2))*rot3('z', phi_rpy(3));
    return
  end
  
  Points = structure_or_points;
  Points_RT = R*T*[Points
                   ones(1, size(Points, 2))];
  Points_hc = P*Points_RT;
  Di = diag(1./Points_hc(end,:));
  Points_hc = Points_hc*Di;
  Points_view_plane = Points_hc([1:2],:);
  pseudo_dist = Points_hc(3,:);
  inside = ( a*Points_RT(3,:) + b >= -abs(Points_RT(3,:)) ) & ...
           ( a*Points_RT(3,:) + b <= +abs(Points_RT(3,:)) );
       
  if any(~inside)
    disp('some points outside view fulcrum ')
    disp(Points)
  end
end
