%% GaussianClassify.m

%% Recognition
load MultiChannel.mat
N_class = 9;
% Train each classifier saperately
n_dim = length(X1(1, :));
train = zeros(N_class, 50, n_dim);
index = ones(1, N_class);
for i = 1:length(y1)
    train(y1(i) ,index(y1(i)), :) = X1(i,:);
    index(y1(i)) = index(y1(i)) + 1;
end
%% estimate mea and covariance for each class
mea = zeros(N_class, n_dim);
covariance = zeros(N_class, n_dim, n_dim);
for i=1:N_class
    mea(i,:) = squeeze(sum(train(i,:,:), 2))'./ nnz(train(i,:,1));
    covariance(i,:,:) = cov(squeeze(train(i,:,:)));
end
%% build coefficient of discriminant function
W = zeros(N_class, n_dim, n_dim);
w = zeros(N_class, n_dim);
w0 = zeros(N_class, 1);
for i=1:N_class
    inv_cov = inv(squeeze(covariance(i,:,:)));
    W(i,:,:) = -0.5 * inv_cov; % 18*18
    w(i,:) = (inv_cov*mea(i,:)')'; % 1*18
    w0(i) = -0.5*mea(i,:)*inv_cov*mea(i,:)' - 0.5*log(det(squeeze(covariance(i,:,:)))) + log(1/N_class);
end
%% classification using discriminant function

class = G(X2, W, w, w0);
run MeasurePerformance

    