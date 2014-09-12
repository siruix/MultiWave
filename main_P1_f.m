%% main_P1_f 
% plot linear conv and circular convolusion of signal2 with filter1
load signal2.dat
load filter1.dat
s2_circonv = circular_conv(signal2, filter1);
s2_linconv = linear_conv(signal2, filter1);

figure(1)
plot([1:length(s2_linconv)], s2_linconv)
title('linear convolution')
figure(2)
plot([1:length(s2_circonv)], s2_circonv)
title('circular convolution')

