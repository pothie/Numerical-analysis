function R = rot3(about_axis, theta)
% rot3 - calculates the rotation matrix in 3D for
%        rotating a vector by  theta  degrees about
%        one of the three principal axes
%        (this is the opposite of rotating the axes while keeping
%        the vector fixed)
% input:
%   about_axis = 1 or 'x' - about the x-axis
%              = 2 or 'y' - about the y-axis
%              = 3 or 'z' - about the z-axis
%   theta (in degrees)  
% output:
%   the  3 x 3  rotation matrix
%
  if  nargin ~= 2
    '*****  wrong number of arguments  *****'
    return;
  end
  if ischar(about_axis)
    if length(about_axis) ~= 1
      error('***** rot3 - incorrect string for axis')
    else
      about_axis = double(lower(about_axis)) - double('x') + 1;
    end
  end
  c = cosd(theta);
  s = sind(theta);
  if about_axis == 1
    R = [1  0  0
         0  c -s
         0  s  c];
  % note that this case has the signs on the sine terms
  % reversed compared to the other two cases
  % this is because, looking down the positive y axis,
  % the x axis is 90 degrees ahead of the z axis
  % in the other two cases the x axis is 90 degrees
  % behind the y or the z axis
  elseif about_axis == 2
    R = [c  0  s
         0  1  0
        -s  0  c];
  elseif about_axis == 3
    R = [c -s  0
         s  c  0
         0  0  1];
  else
    'error - incorrect axis number'
  end
end
