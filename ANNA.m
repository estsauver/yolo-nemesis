function [w_vector, err_tot] = ANNA(w_vector, param)
%
% X_actual = cell mass concentration returned by simulation
% S_actual = substrate concentration returned by simulation
% F = feed rate
% N_t = number of non-dimensionalized time points

global X_actual S_actual

[X, S] = call_ANN(w_vector);

err(1, :) = X - X_actual; 
err(2, :) = S - S_actual;
err_tot = -sum(sum(err.^2));


end