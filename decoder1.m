function y_cap = decoder1(c0_q, d_q, q)

% inverse quantization
c0 = q*c0_q;
d = q*d_q;

% invDWT
y_cap = inverseDWT(c0, d);

end