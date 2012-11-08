function [X, S] = call_ANN(w_vector)

global F X_actual

N_t = length(X_actual);

X=zeros(length(F),1);
S=X;
X(1) = 0.5;
S(1) = 0.5;

net = network;
net.numInputs = 3;
net.numLayers = 2;
net.biasConnect = [1; 1; 1];
net.inputConnect(1,1)=1;
net.inputConnect(1,2)=1;
net.inputConnect(1,3)=1;
net.layerConnect =[1 1;
					1 0;];
net.outputConnect = [0 1];
net.layers{1}.size = w_vector[1]
net.layers{1}.transferfcn = 'logsig';
net.layers{1}.initFcn = 'initnw';
net.layers{2}.size = w_vector[2];
net.layers{2}.transferfcn = 'satlin';
net.layers{2}.initFcn= 'initnw';
net.inputConnect(1,1).delays = [0 1 2];
net.inputConnect(1,2).delays = [0 1 2];
net.inputConnect(1,3).delays = [0 1 2];
net.layerConnect(1,1).delays = [1];
net.layerConnect(1,2).delays = [1 2];
net.initFcn = 'initlay';

net.performFcn='mse';
net.trainFcn= 'trainlm';
net.divideFcn = 'dividerand';
net.plotFcns = {'plotperform' , 'plottrainstate'};


net = init(net);
T = sim_data;
net = train(net,F,T);



for t = 2:N_t;
    Z0 = [F(t-1); X(t-1); S(t-1); 1];
    Z1 = W1*Z0;

    L2 = [1./(1+exp(-Z1)); 1];
    Z2 = W2*L2;

    L3 = 1./(1+exp(-Z2));
    X(t) = L3(1); S(t) = L3(2);

end
    
end