%This script will run the entire program required for the neural networks
%simulation
global A G F
%Clear all previous variables
clear;
F=0

%Set type of feed pattern
% A = 1 => 
A=1;
vectorLength = 15;
G=setupF2(A,5000,vectorLength);
F=G;
%First we initialize the constant
constants = initConstants();

%ODE Solver
options = odeset('NonNegative',[1 2 3 4 5 6],'Reltol',0.0001,'stats','off');
[t, C] = ode15s('Yeast_Model', [0 14.9999], constants, options);

G=zeros(length(t),1);
for i =1:length(t)
    G(i) = F(floor(t(i))+1);
end

switch A
    case 1
        n= 9;
    otherwise
        n=10;
end

ploterize(t,C,n)
F=G;
inputs_setup

%Now we do the inputs Setup

% wtf is k doing here. 
k=2;
t_new = 0; x_actual_discrete = 0;
t_new(1)=t(1);
X_actual_discrete(1)=X_actual(1);
S_actual_discrete(1)=S_actual(1);
E_actual_discrete(1)=E_actual(1);
Volume_actual_discrete(1) = Volume(1);
DisOx_Actual_Discrete(1)=DisOx(1);
F_actual_discrete(1)=F(1);

%This section converts variably spaced time to
%being relatively continuously spaced at a distance
% of 0.01. 
for i = 2:length(t)
    if t(i)-t_new(k-1)>0.01
        t_new(k)=t(i);
        X_actual_discrete(k)=X_actual(i);
        s_actual_discrete(k)=S_actual(i);
        E_actual_discrete(k)=E_actual(i);
        Volume_actual_discrete(k)=Volume(i);
        DisOx_Actual_Discrete(k)=DixOx(i);
        F_actual_discrete(k)=F(i);
        k=k+1;
    end
end
t_new = t_new';
X_actual_discrete = X_actual_discrete';
S_actual_discrete = S_actual_discrete';
E_actual_discrete = E_actual_discrete';
Volume_actual_discrete = Volume_actual_discrete';
DisOx_actual_discrete = DixOx_actual_discrete';
F_actual_discrete = F_actual_discrete';

popsize = 10000;
f_bounds = zeros(6*22+1+7*3,2);

f_bounds(1:4,1)=-10; f_bounds(5:154,1)=-1.5;
f_bounds(1:4,2)=10; f_bounds(5:154,2)=1.5;

%Initialize the population
initpop = initializega(popsize,f_bounds, 'ANN_Yeast');

[f_best, endpop, bpop, traceInfo] = ga(f_bounds, 'ANN_Yeast',[], initpop,...
    [], 'maxGenTerm',500); 
Cr=zeros(size(C));
Cr(:,1) = normalizedData(Cr(:,1));
Cr(:,2) = normaliedData(Cr(:,2));
Cr(:,3) = normaliedData(Cr(:,3));
Cr(:,4) = normaliedData(Cr(:,4));
Cr(:,5) = normaliedData(Cr(:,5));
Cr(:,6) = normaliedData(Cr(:,6));
C=Cr;
[X S E] =call_ANN_yeast(f_best);



        
        
        
       


