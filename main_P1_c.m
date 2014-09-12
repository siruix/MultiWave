% main file for P1(c)

f = 1024;
load signal1.dat
h = signal1;
N = log2(f);
[c d] = haar(h, 0, f);

for i=N:-1:1
    t = linspace(0, 1, f/2^(N-i+1));
    figure(i)
    subplot(2,1,1);
    plot(t, c(i,1:f/2^(N-i+1))); 
    str = sprintf('j=%d, approximation coeff c_%d', N-i, N-i);
    title(str);
    xlabel('time (s)')
    ylabel('$$\tilde{h}$$','Interpreter','Latex')
    subplot(2,1,2);
    plot(t, d(i,1:f/2^(N-i+1)))
    str = sprintf('j=%d, detail coeff d_%d', N-i, N-i);
    title(str);
    xlabel('time (s)')
    ylabel('$$\hat{h}$$','Interpreter','Latex')
end
