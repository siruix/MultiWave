% testing the matlab 
N = 2;
load signal1.dat
figure(1)
plot([1:length(signal1)], signal1)
y_matlab = wavedec(signal1,N,'haar');
hold on
plot([1:length(y_matlab)], y_matlab, 'r')
%%
J = 10;
N = 1024;
c = zeros(1+J, N);
d = zeros(1+J, N);
    h = [1 1]./sqrt(2);
    g = [1 -1]./sqrt(2);
c(J+1, :) = signal1;
for j = (J-1):-1:0
    for k=0:(N/2^(J-j)-1)
        for m = 2*k:(2*k+1)
            c(j+1, k+1) = c(j+1, k+1) + h(m-2*k+1) * c(j+2, m+1);
            d(j+1, k+1) = d(j+1, k+1) + g(m-2*k+1) * c(j+2, m+1);
        end
    end
end
figure(2)
plot([1:length(c(J-1, :))], c(J-1, :))
