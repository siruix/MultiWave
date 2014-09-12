function y = inverseDWT(c0, d)
    h = [1 1]./sqrt(2);
    g = [1 -1]./sqrt(2);
% debug
N = 1024;
J = log2(N);
% end debug
% c0 is a scaler
% d is 11*1024 matrix where row 1 to 10 carry value

% calculate cJ using filter banks
c = zeros(J+1, N);
c(1,1) = c0;
for j = 0:J-1
    for k = 0:(2^(j+1)-1)
        for m = max(0,ceil((k-1)/2)):floor(k/2)
            c(j+2, k+1) = c(j+2, k+1) + c(j+1, m+1)*h(k+1-2*m) + d(j+1, m+1)*g(k+1-2*m);
        end
    end
end


% reconstruct signal
% J level wavelet decomposition J=10 when N = 1024
% find all the scaleing function (phi) and wavelet basis (psi) 
% first dimension of phi means phi_j, the order of approximation
% second dimension of phi means k, the time shift
% third dimension of phi means number of samplling point
phi = zeros(J+1, 2^J, N);
psi = zeros(J+1, 2^J, N);
phi(1,1,:) = ones(1, N);
psi(1,1,:) = [ones(1, N/2) -ones(1, N/2)];
tmp_phi = squeeze(phi(1,1,:))';
tmp_psi = squeeze(psi(1,1,:))';
for j = 1:J %2

    phi(j+1,1,:) = 2^(0.5*j) .* [tmp_phi(1:(2^j):end) zeros(1, 1024-1024/(2^j))];
    psi(j+1,1,:) = 2^(0.5*j) .* [tmp_psi(1:(2^j):end) zeros(1, 1024-1024/(2^j))];
    for i = 1:(2^j-1)%3
        phi(j+1,i+1,:) = circshift(squeeze(phi(j+1,1,:)),1024/(2^j)*i)';
        psi(j+1,i+1,:) = circshift(squeeze(psi(j+1,1,:)),1024/(2^j)*i)';
    end
end
y = zeros(1, N);
for k=0:N-1
    y = y + c(J+1, k+1) * squeeze(phi(J+1, k+1, :))';
end
end