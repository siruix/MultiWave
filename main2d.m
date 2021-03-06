%% main2d.m

%% encoding
load 6397.mat
red = squeeze(IM6397(:,:,1));
red = double(red);
green = squeeze(IM6397(:,:,2));
green = double(green);
blue = squeeze(IM6397(:,:,3));
blue = double(blue);
overall = (red+green+blue)/3;
N = length(blue(1,:));
J = log2(N);
[C,S] = wavedec2(blue,J,'haar');

Etp = zeros(1, 100);
MSE = zeros(1, 100);
count = 0;
%% quantization
% uniform quantization
for k=11:100:9911
    count = count +1;
k = 1011; % k is odd
q = 2*max([C -C])/k;
C_q = round(C/q);

%% dequantization
C_cap = q*C_q;

%% decoding
blue_cap = waverec2(C_cap,S,'haar');

% test

figure(1)
image((IM6397(:,:,1)))
title('Red Channel. Original')
colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]), colorbar;
figure(2)
image((IM6397(:,:,2)))
title('Green Channel. Original')
colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;
figure(3)
image((IM6397(:,:,3)))
title('Blue Channel. Original')
colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;
figure(4)
image(blue_cap)
colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;
title('Blue Channel. Reconstructed')
%% Calculate Entropy
hist = zeros(1, k+1);
for i = 1:length(C_q)
    hist(C_q(i)+(k-1)/2+1) = hist(C_q(i)+(k-1)/2+1)+1;
end
prob = hist./sum(hist);

for i = 1:length(prob)
    Etp(1,count) = Etp(1, count) - prob(i)*log2(max(prob(i),eps));
end
%% Calculate MSE
% calculate probability

MSE(1,count) = sum(sum((overall-combine_cap).^2))/N^2;
end

scatter(MSE, Etp)
xlabel('Mean Sqare Error')
ylabel('Entropy')
title('Image Commpression: overall')