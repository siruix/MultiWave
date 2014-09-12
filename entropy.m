%% entropy.m
% calculate entropy 
count=0;
Etp = zeros(1, 100);
MSE = zeros(1, 100);
for k=11:10:251
    count = count+1;
%k = 101; % k is odd
run encoder1;
% return value c0_q and d_q. q is the step
hist = zeros(1, k+1);
hist(c0_q+(k-1)/2+1) = hist(c0_q+(k-1)/2+1)+1;
for i = 1:N
    hist(d_q(i)+(k-1)/2+1) = hist(d_q(i)+(k-1)/2+1)+1;
end

%plot([1:k+1], hist)
% calculate entropy
prob = hist./sum(hist);

for i = 1:length(prob)
    Etp(1,count) = Etp(1, count) - prob(i)*log2(max(prob(i),eps));
end

x_cap = decoder1(c0_q, d_q, q);

% calcualte mean square error
MSE(1,count) = sum((signal1-x_cap).^2)/N;
end
% plot entropy as a function of MSE for various q
scatter(MSE, Etp)
xlabel('Mean Sqare Error')
ylabel('Entropy')
 
