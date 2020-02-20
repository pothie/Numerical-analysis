function h = plot3m(M, varargin)
  if nargout == 0
    plot3(M(1,:), M(2,:), M(3,:), varargin{:})
  else
    h = plot3(M(1,:), M(2,:), M(3,:), varargin{:});
  end
end
