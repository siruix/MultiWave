% main_P1_g
% P1 (g)
load signal1.dat
N = length(signal1);

J = log2(N);
[c d] = haar2(signal1);
t = 1:N;
plot(t, [c(11,:)])