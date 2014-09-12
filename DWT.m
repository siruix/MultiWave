function [c0 d] = DWT(x, J)
[C D] = haar2(x);
% cJ is the 
c0 = C(1, 1);
d = D;
end