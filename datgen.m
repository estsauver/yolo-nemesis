%  datgen
%
%  generates simulation data for ANN training from "in silico" model
%
%********************************************************************
global Feed
%********************************************************************
Feed = zeros(82,1);
for i=1:81
    if rand < 0.5
        Feed(i)=0.3;
    else
        Feed(i)=0.5;
    end
end
Feed(82) = Feed(81);
%********************************************************************
sim_data=zeros(81,4);
sim_data(:,2)=Feed(1:81,1);
Y0=[0.5 0.5];
tdata=zeros(1,81);
for i=1:81
    tdata(1,i)=i-1;
end
options=odeset('NonNegative',[1 2]);
[T Y]=ode45(@silico,tdata,Y0,options);
sim_data(:,1)=T; sim_data(:,3:4)=Y;
%*********************************************************************
%  Each row of sim_data : t F X S
%*********************************************************************
save SimData.txt sim_data -ascii;
%*********************************************************************
%  Plot Simulation Results
%*********************************************************************
t=sim_data(:,1); F=sim_data(:,2); X=sim_data(:,3); S=sim_data(:,4);
subplot(3,1,1);
hold on;
axis([0 80 0.2 0.6]); title('Feed');
for i=1:length(F)-1
    tt=[t(i); t(i+1); t(i+1)]; f=[F(i); F(i); F(i+1)];
    plot(tt,f,'-b');
end
hold off;
subplot(3,1,2);
plot(t,X,'-r',t,X,'ok');
title('Cell Mass');
subplot(3,1,3);
plot(t,S,'-r',t,S,'ok');
title('Substrate');
