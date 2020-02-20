function M = mathword2(size_word, shift_word, separate_letters)
% mathword - this function returns a  2 x n  array which spells out
%            the word MATH which is initially centered at (0,0)
%            the first row is the  x  coordinates and the econd the
%            y  coordinates
% input:
%   size_word = 2-vector
%               [width,height] - the word extends horizontally from
%               -width/2  to  +width/2 and vertically from  -height/2  to
%               +height/2 
%   shift_word = (optional, default is no shift) 2-vector
%                [shift_hor,shift_ver] - shift the word by shift_hor
%                horizontally and shift_ver vertically
%   separate_letters = (optional, default = false)
%                      false - the four letters are connected by a line
%                      true  - the four letters are separate from each other
% output:
%   the  2 x n  array
%

  width = size_word(1);
  height = size_word(2);
  if nargin == 1 
    shift_word = [];
    separate_letters = false;
  elseif nargin == 2
    separate_letters = false;
  end
  if isempty(shift_word)
    shift_word = [0 0];
  end
  if ~separate_letters
    M = [
        0 0
        0 4
        2 1
        4 4
        4 0      %  M
        5 0
        7 4
        6 2
        8 2
        7 4
        9 0      %  A
        11 0
        11 4
        9 4
        13 4
        11 4
        11 0     %  T
        14 0
        14 4
        14 2
        18 2
        18 4
        18 0     %  H
        ]';
  else
    M = [
        0 0
        0 4
        2 1
        4 4
        4 0         %  M
        4 -Inf
        5 0
        7 4
        6 2
        8 2
        7 4
        9 0         %  A
        9 -Inf
        11 0
        11 4
        9 4
        13 4
        11 4
        11 0        %  T
        11 -Inf
        14 0
        14 4
        14 2
        18 2
        18 4
        18 0        %  H
        ]';
  end
  w = max(M(1,:));
  h = max(M(2,:));
  M = [1/w 0;0 1/h]*M - .5*ones(size(M));
  M = [width 0;0 height]*M;
  M = M + repmat(shift_word(:), 1, size(M,2));
 
  M(3,:)= zeros(1,23);
end
