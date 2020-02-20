function y = sign0(x)
y = ones(size(x));
y(x < 0) = -1;
end