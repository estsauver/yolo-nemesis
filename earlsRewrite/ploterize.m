function [  ] = ploterize( t,C,n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


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
end

