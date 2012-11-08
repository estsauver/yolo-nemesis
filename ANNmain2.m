clc;
clear;
close all;
SAVE = 1;

global X_actual S_actual F 


datgen;
X_actual=sim_data(:,3);
S_actual=sim_data(:,4);
T=sim_data(:,1);
F=sim_data(:,2);

%Number of Params in genetic algorithim
J = 14;

%Set bounds of weights
f_bounds=zeros(J, 2);
f_bounds(:,1)=0;
f_bounds(:,2)=5;

%Set population parameters
pop_size = 1000;
maxGenTerm = 1000;

%initialize the population
initpop = initializega(pop_size, f_bounds, 'ANNA');

[f_best, endpop, bpop, traceInfo]=ga(f_bounds, 'ANNA',[],initpop,[],...
                                     'maxGenTerm',maxGenTerm);

w_vector = f_best(1:end-1);

[X_neur, S_neur] = call_ANN(w_vector);


f = figure(2);
plot(T, [X_actual S_actual], '-');
hold on
plot(T, X_neur,'o-',T, S_neur, 'o-');
title('Comparison of Simulated and ANN Predicted Values');
xlabel('Non-dimensionalized Time');
ylabel('Non-dimensionalized Concentration');
legend('Sim X', 'Sim S', 'ANN X', 'ANN S', 'Location', 'NorthWest');
hold off
figure(3)
plot(T,X_neur-X_actual,T,S_neur-S_actual)
eX1=norm(X_neur-X_actual); %Euclidean error in X
eS1=norm(S_neur-S_actual); %Euclidean error in S
datgen
T=sim_data(:,1);
F=sim_data(:,2);
X_actual=sim_data(:,3);
S_actual=sim_data(:,4);

[X_neur,S_neur]=call_ANN(w_vector);
f = figure(5);
plot(T, [X_actual S_actual], '-');
hold on
plot(T, X_neur,'o-',T, S_neur, 'o-');
title('Comparison of Simulated and ANN Predicted Values with New Data');
xlabel('Non-dimensionalized Time');
ylabel('Non-dimensionalized Concentration');
legend('Sim X', 'Sim S', 'ANN X', 'ANN S', 'Location', 'NorthWest');
hold off
figure(6)
plot(T,X_neur-X_actual,T,S_neur-S_actual)    
eX2=norm(X_neur-X_actual); %Euclidean error in X for new set
eS2=norm(S_neur-S_actual); %Euclidean error in Y for new set