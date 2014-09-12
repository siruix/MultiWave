%% P1 b
function [c d] = haar(h, J, f)
%[C,L] = wavedec(signal1,J,'haar');
%h_tilde = waverec(C, L, 'haar');
% implementation using inner product instead of filter banks
% debug
% f = 1024;
% load signal1.dat
% h = signal1;
% J=3;
% end debug
N = log2(f);    % N level wavelet decomposition N=10 when f = 1024
% find all the scaleing function (phi) and wavelet basis (psi) 
% first dimension of phi means phi_j, the order of approximation
% second dimension of phi means k, the time shift
% third dimension of phi means number of samplling point
phi = zeros(N+1, 2^N, f);
psi = zeros(N+1, 2^N, f);
phi(1,1,:) = ones(1, f);
psi(1,1,:) = [ones(1, f/2) -ones(1, f/2)];
tmp_phi = squeeze(phi(1,1,:))';
tmp_psi = squeeze(psi(1,1,:))';
for j = 1:N %2

    phi(j+1,1,:) = 2^(0.5*j) .* [tmp_phi(1:(2^j):end) zeros(1, 1024-1024/(2^j))];
    psi(j+1,1,:) = 2^(0.5*j) .* [tmp_psi(1:(2^j):end) zeros(1, 1024-1024/(2^j))];
    for i = 1:(2^j-1)%3
        phi(j+1,i+1,:) = circshift(squeeze(phi(j+1,1,:)),1024/(2^j)*i)';
        psi(j+1,i+1,:) = circshift(squeeze(psi(j+1,1,:)),1024/(2^j)*i)';
    end
end
c = zeros(N+1, 2^N);
d = zeros(N+1, 2^N);
for j = 1:(N+1)
% projection of h into V0
    for i = 1:(2^(j-1))
        c(j,i) = inner_product(h, squeeze(phi(j,i,:))); % size of hj_tilde should be K
% projection of h into W0
        d(j,i) = inner_product(h, squeeze(psi(j,i,:)));
% projection of h into VJ
% c1(1) = inner_product(h, phi(2,1,:));
% c1(2) = inner_product(h, phi(2,2,:));
    end
end
end