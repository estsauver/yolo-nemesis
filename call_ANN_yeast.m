function [X S E] = call_ANN_yeast( w_vector )

global X_actual2 DisOx2 Volume2 F2 S_actual2 t_new E_actual2
X_actual=X_actual2;
S_actual=S_actual2;
E_actual=E_actual2;
Volume=Volume2;
DisOx=DisOx2;
F=F2;


N_t=length(X_actual);
X=zeros(N_t,1); S=zeros(N_t,1); E=zeros(N_t,1);

%first level
W0 = reshape(w_vector(1:6*22), 6, 22);
W1 = reshape(w_vector(6*14+1:6*14+7*3), 3, 7);
% W0=[w_vector(1:8); w_vector(9:16); w_vector(17:24); w_vector(25:32); w_vector(33:40); ...
%     w_vector(41:48); w_vector(49:56); w_vector(57:64); w_vector(65:72); w_vector(73:80);...
%     w_vector(81:88); w_vector(89:96); w_vector(97:104); w_vector(105:112); w_vector(113:120)];
% 
% W1=[w_vector(121:129); w_vector(130:138); w_vector(139:147)];

X(1)=X_actual(1); S(1)=S_actual(1); E(1)=0; %E0 is always assumed to be 0;
L1_old=zeros(6,1); L2_old=zeros(12,1);

for i=2:N_t
    
    Z0=[DisOx(i); Volume(i); F(i);1; L1_old; L2_old];
    
    %first layer inputs to node values are stored in Z1 (length(Z1)=rows(W0))
    Z1=W0*Z0;
    %outputs of layer 1 to layer 2:
    L1 = [1./(1+exp(-Z1)); 1];
    L1_old=L1(1:6);
    Z2 = W1*L1;
    L2 = (Z2);
    
    L2_old(9:11)=L2_old(7:9);
    L2_old(7:9)=L2_old(4:6);
    L2_old(4:6)=L2_old(1:3);
    L2_old(1:3)=L2;
    
    X(i) = L2(1);
   S(i) = L2(2);
    E(i)=L2(3);
    
end
end

