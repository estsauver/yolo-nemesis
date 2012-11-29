%Program to solve5 the ODE's related to the yeast fermentation model
global A G F
F=0;
%Initializes  The constants
Cs0=1.2;
V0=50000;
Ce0=0;
Co0=2.4*10^-4;
Cc0=0;
X0=0.15;

vectorLength = 15;
F=setupF2(A, 5000, vectorLength);

C0=[Cs0, V0, Ce0, X0, Co0, Cc0];
options=odeset('NonNegative',[1 2 3 4 5 6],'Reltol',0.0001,'stats','off');
[t, C]=ode15s('Yeast_Model',[0 14.9999],C0,options);

G=zeros(length(t),1);
if A==1
    for i=1:length(t)
        if mod(floor(t(i)),2)==0
            G(i)=F(floor(t(i))+1);
        else
            G(i)=F(floor(t(i))+1);
        end
    end
end
if A==2
    for i=1:length(t)
        if mod(floor(t(i)),2)==0
            G(i)=F(floor(t(i))+1);
        else
            G(i)=F(floor(t(i))+1);
        end
    end
end
if A==1
    n=9;
else
    n=10;
end

figure(n)
subplot(2,3,1)
plot(t,C(:,1))
axis([0 t(length(t)) 0 max(C(:,1))])
xlabel('Cs')
subplot(2,3,2)
plot(t,C(:,2))
xlabel('V')
axis([0 t(length(t)) 0 max(C(:,2))])
subplot(2,3,3)
plot(t,C(:,3))
xlabel('Ce')
axis([0 t(length(t)) 0 max(C(:,3))])
subplot(2,3,4)
plot(t,C(:,4))
xlabel('X')
axis([0 t(length(t)) 0 max(C(:,4))])
subplot(2,3,5)
%Dissolved Oxygen
plot(t,C(:,5))
xlabel('DO')
axis([0 t(length(t)) 0 max(C(:,5))])
subplot(2,3,6)
plot(t,C(:,6))
xlabel('Cc')
axis([0 t(length(t)) 0 max(C(:,6))])
F=0;
F=G;
inputs_setup



