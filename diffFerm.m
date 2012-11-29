function dYdT = diffFerm(T, Y)
%
% dYdT = diffFerm(T,Y)
% Returns derivative of state variable Y, where Y = [X; S];
% T = non-dimensionalized time
% X = non-dimensionalized cell mass concentration
% S = non-dimensionalized substrate concentration
% F = feed rate
% K_m, K_i = parameters

global K_m K_i v F F_0

dYdT = zeros(2,1);

X = Y(1);
S = Y(2);

u = S/(K_m + S + S^2/K_i);

dYdT(1) = u*X - F/v*X;
dYdT(2) = -u*X + F_0 - F/v*S;

end