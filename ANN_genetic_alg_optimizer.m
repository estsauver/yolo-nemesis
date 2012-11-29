%implement a genetic algorithm to solve for the weights of the neural
%network connections
clear;
global A t_new X_actual2 S_actual2 E_actual2 F Volume2 F2 DisOx2 S_actual Volume X_actual E_actual

%Variable that determines the type of feed that's used
A=1;

%I'm a little unclear why all of these variables need to be defined before
%being called.
F=0;
t_new=0;
Volume=0; X_actual=0; S_actual=0; E_actual=0; Volume2=0; E_actual2=0; S_actual2=0; X_actual2=0;
F2=0; DisOx=0; DisOx2=0;

Yeast_Optimization

%WTF is k?
k=2;
t_new=0; X_actual2=0;
t_new(1)=t(1);
X_actual2(1)=X_actual(1);
S_actual2(1)=S_actual(1);
E_actual2(1)=E_actual(1);
Volume2(1)=Volume(1);
DisOx2(1)=DisOx(1);
F2(1)=F(1);
for i=2:length(t)
    if t(i)-t_new(k-1)>0.01
        t_new(k)=t(i);
        X_actual2(k)=X_actual(i);
        S_actual2(k)=S_actual(i);
        E_actual2(k)=E_actual(i);
        Volume2(k)=Volume(i);
        F2(k)=F(i);
        DisOx2(k)=DisOx(i);
        k=k+1;
    end
end
t_new=t_new';
X_actual2=X_actual2';
S_actual2=S_actual2';
E_actual2=E_actual2';
Volume2=Volume2';
F2=F2';
DisOx2=DisOx2';

popsize=10000;
f_bounds=zeros(6*22+1+7*3,2); %It might just be 14,1 for this problem
f_bounds(1:4,1)=-10; f_bounds(5:154,1)=-1.5;
f_bounds(1:4,2)=10; f_bounds(5:154,2)=1.5;
%initialize the population
initpop=initializega(popsize,f_bounds, 'ANN_Yeast');

[f_best,endpop,bpop,traceInfo]=ga(f_bounds,...
    'ANN_Yeast',[],initpop,...
   [],'maxGenTerm',500);%'normGeomSelect']);
%    initpop=endpop;
Cr=zeros(size(C));
for i=1:length(C)
    Cr(i,1)=(C(i,1)-min(C(:,1)))/(max(C(:,1))-min(C(:,1)));
    Cr(i,2)=(C(i,2)-min(C(:,2)))/(max(C(:,2))-min(C(:,2)));
    Cr(i,3)=(C(i,3)-min(C(:,3)))/(max(C(:,3))-min(C(:,3)));
    Cr(i,4)=(C(i,4)-min(C(:,4)))/(max(C(:,4))-min(C(:,4)));
    Cr(i,5)=(C(i,5)-min(C(:,5)))/(max(C(:,5))-min(C(:,5)));
    Cr(i,6)=(C(i,6)-min(C(:,6)))/(max(C(:,6))-min(C(:,6)));
end
C=Cr;
[X S E]=call_ANN_yeast(f_best);
figure(2)
plot(t_new,X,'*b','markersize',8)
hold on
plot(t_new,X,'g')
plot(t,C(:,4))
hold off
title('Training Set with Neural Network Fit')
 figure(3)
 plot(t_new,S)
 hold on
 plot(t,C(:,1))
 hold off
 figure(4)
 plot(t_new,E)
 hold on
 plot(t,C(:,3))
 hold off

A=2;
Yeast_Optimization
k=2;
t_new=0; X_actual2=0;
t_new(1)=t(1);
X_actual2(1)=X_actual(1);
S_actual2(1)=S_actual(1);
E_actual2(1)=E_actual(1);
Volume2(1)=Volume(1);
DisOx2(1)=DisOx(1);
F2(1)=F(1);
for i=2:length(t)
    if t(i)-t_new(k-1)>0.01
        t_new(k)=t(i);
        X_actual2(k)=X_actual(i);
        S_actual2(k)=S_actual(i);
        E_actual2(k)=E_actual(i);
        Volume2(k)=Volume(i);
        F2(k)=F(i);
        DisOx2(k)=DisOx(i);
        k=k+1;
    end
end
t_new=t_new';
X_actual2=X_actual2';
S_actual2=S_actual2';
E_actual2=E_actual2';
Volume2=Volume2';
F2=F2';
DisOx2=DisOx2';
[X S E]=call_ANN_yeast(f_best);
Cr=zeros(size(C));
for i=1:length(C)
    Cr(i,1)=(C(i,1)-min(C(:,1)))/(max(C(:,1))-min(C(:,1)));
    Cr(i,2)=(C(i,2)-min(C(:,2)))/(max(C(:,2))-min(C(:,2)));
    Cr(i,3)=(C(i,3)-min(C(:,3)))/(max(C(:,3))-min(C(:,3)));
    Cr(i,4)=(C(i,4)-min(C(:,4)))/(max(C(:,4))-min(C(:,4)));
    Cr(i,5)=(C(i,5)-min(C(:,5)))/(max(C(:,5))-min(C(:,5)));
    Cr(i,6)=(C(i,6)-min(C(:,6)))/(max(C(:,6))-min(C(:,6)));
end
C=Cr;
figure(5)
plot(t_new,X,'*b','markersize',8)
hold on
plot(t_new,X,'g')
plot(t,C(:,4))
hold off
title('Neural Network Performance with New Data Set')
figure(6)
plot(t_new,S)
hold on
plot(t,C(:,1))
hold off
figure(7)
plot(t_new,E)
hold on
plot(t,C(:,3))
hold off
figure(8)
plot(t_new,F2)
 
Error=sqrt(sum((X-X_actual2).^2));
pct_err=zeros(length(X),1);
for i=2:length(X)
    pct_err(i)=(X(i)-X_actual2(i))/X_actual(i);
end
M=mean(pct_err);
 
