% DWT encoder
load signal1.dat
N = length(signal1);

J = log2(N);
[c0 d] = DWT(signal1, J);


% uniform quantization
% k = 101; % k is odd
qc = 2*max([c0 -c0])/k;
qd = 2*max(max(d))/k;
qd2 = 2*max(max(-d))/k;
q = max([qc qd qd2]);
c0_q = round(c0/q);
d_q = round(d/q);




% test
% y = inverseDWT(c0_q, d_q, q);

