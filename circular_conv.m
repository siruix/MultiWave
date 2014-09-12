function z = circular_conv(x, y)
%debug
% x = [5 1 -2 4];
% y = [1 2 3];
%end debug
if (length(x)>length(y))
    N = length(x); % zero padding to length N
else
    N = length(y);
end
    xpad = [x zeros(1,N-length(x))];
    ypad = [y zeros(1,N-length(y))];
    z = zeros(1, N);
    for k=0:(N-1)
        for n = 0:(N-1)
          z(k+1) = z(k+1) + xpad(n+1) * ypad(mod(k-n, N)+1);
        end
    end
end