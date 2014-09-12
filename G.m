% Discriminant Function 
% X2 is data 450*18
% W is 9*18*18
% w is 9*18
% w0 is 9*1
function class = G(X2, W, w, w0)

N_data = size(X2, 1);
N_class = 9;

class = zeros(N_data,1);
% n_dim = 18;
% W_j = zeros(n_dim, n_dim);

    
for i=1:N_data
    x = X2(i,:);
    tmp_max = -Inf;
    for j = 1:N_class      
        W_j = squeeze(W(j,:,:));
        tmp = x*W_j*x' + w(j,:)*x' + w0(j);
        if (tmp_max < tmp)
            class(i) = j;
            tmp_max = tmp;
        end
    end
end
end

