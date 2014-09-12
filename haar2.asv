function [c d] = haar2(signal1)
%debug
%    J = 10;
%    N = 1024;
%    load signal1.dat

%    signal1 = [1 2 3 4];
    h = [1 1]./sqrt(2);
    g = [1 -1]./sqrt(2);
    N = length(signal1);
    J = log2(N);
%end debug
c = zeros(1+J, N);
d = zeros(1+J, N);
for k = 0:N-1
    c(J+1, k+1) = 2^(-J/2) * signal1(2^(-J) * k * N + 1);
end

% use analysis filter banks to calculate coarse projection
%c_j = zeros(J, N/2); % projection in V space
%d_j = zeros(J, N/2); % projection in W space
for j = (J-1):-1:0
    for k=0:(N/2^(J-j)-1)
        for m = 2*k:(2*k+1)
            c(j+1, k+1) = c(j+1, k+1) + h(m-2*k+1) * c(j+2, m+1);
            d(j+1, k+1) = d(j+1, k+1) + g(m-2*k+1) * c(j+2, m+1);
        end
    end
end
end