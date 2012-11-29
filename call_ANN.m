function [X, S] = call_ANN(w_vector)

global F X_actual

N_t = length(X_actual);


W1 = [w_vector(1:4); w_vector(5:8)];
W2 = [w_vector(9:11); w_vector(12:14)];

X(1) = 0.5;
S(1) = 0.5;

for t = 2:N_t;
    Z0 = [F; X(t-1); S(t-1); 1];
    Z1 = W1*Z0;

    L2 = [1./(1+exp(-Z1)); 1];
    Z2 = W2*L2;

    L3 = 1./(1+exp(-Z2));
    X(t) = L3(1); S(t) = L3(2);

end
    
end