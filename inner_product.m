function p = inner_product(sequence1, sequence2)
N = length(sequence1);
p = 0;
for i = 1:N
    p = p + sequence1(i)*sequence2(i);
end
end