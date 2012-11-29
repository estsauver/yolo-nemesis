clc;
clear;
close all;
SAVE = 1;

global K_m K_i v F F_0 X_actual S_actual

%Parameters
K_m = 0.25;  %dim/less
K_i = 1.0;   %dim/less
v   = 1;     %dim/less

%Feed
F   = 0.6*v; %L/h
F_0 = F;


%Initial Conditions
S_0 = 0.5; %dim/less
X_0 = 0.5; %dim/less

Y0(1) = X_0;
Y0(2) = S_0;

options = odeset('NonNegative',[1 2]);
[T, Y] = ode45('diffFerm', [0 10], Y0, options);

X_actual = Y(:,1);
S_actual = Y(:,2);

dXdT = diff(X_actual)./diff(T);
dSdT = diff(S_actual)./diff(T);

J = 14;

%Set bounds of weights
f_bounds=zeros(J, 2);
f_bounds(:,1)=-4;
f_bounds(:,2)=4;

%Set population parameters
pop_size = 1000;
maxGenTerm = 100000;

%initialize the population
initpop = initializega(pop_size, f_bounds, 'ANNA');

[f_best, endpop, bpop, traceInfo]=ga(f_bounds, 'ANNA',[],initpop,[],...
                                     'maxGenTerm',maxGenTerm);

w_vector = f_best(1:end-1);

[X_neur, S_neur] = call_ANN(w_vector);

hold on;
f = figure(1);
plot(T, [X_actual S_actual], '-');
plot(T, [X_neur; S_neur]', 'o-');
title('Comparison of Simulated and ANN Predicted Values');
xlabel('Non-dimensionalized Time');
ylabel('Non-dimensionalized Concentration');
legend('Sim X', 'Sim S', 'ANN X', 'ANN S', 'Location', 'NorthWest');

hold off;
f=figure(2);
plot(bpop(:,1),-bpop(:,16));
title('Best Individual Error');
xlabel('Generational Number');
ylabel('Error');

%if SAVE
 %   print(f,'-dpng', '/Users/kimberlystachenfeld/Documents/Fall 2012/ChBE
 %   160/ANN_v_Simulation');
%end
    
    
    