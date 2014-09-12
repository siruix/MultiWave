function z = linear_conv(x, y)
%debug
% x = [5 1 -2 4];
% y = [1 2 3];
%end debug
    N = length(x)+length(y)-1;
    xpad = [x zeros(1,N-length(x))];
    ypad = [y zeros(1,N-length(y))];
    z = zeros(1, N);
    for k=0:(N-1)
        for n = 0:k
           z(k+1) = z(k+1) + xpad(n+1) * ypad(k-n+1);
        end
    end
end