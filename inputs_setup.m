%inputs
%Feed
global F DisOx Volume
DisOx=0;
Volume=0;
% Feed=zeros(length(t),1);
% for nn=1:length(t);
%     if mod(floor(t(nn,1)),2) == 0
%         Feed(nn,1)=1200;
%     else
%         Feed(nn,1)=1000;
%     end
% end

Fmax=max(F);
Fmin=min(F);

for i=1:length(F)
    F(i)=(F(i)/Fmax);
end

DisOx=[C(:,5)];

DisOxmax=max(DisOx);
DisOxmin=min(DisOx);

for i=1:length(DisOx)
    DisOx(i)=(DisOx(i)-DisOxmin)/(DisOxmax-DisOxmin);
end

Volume=[C(:,2)];

Volmax=max(Volume);
Volmin=min(Volume);
for i=1:length(Volume)
    Volume(i)=(Volume(i)-Volmin)/(Volmax-Volmin);
end



innputs=[F, Volume, DisOx];
%*****************************************************************
%outputs 
%(X Ce Cs)
outtputs=zeros(length(t),3);

XX=[C(:,4)];
XXmax=max(XX);
XXmin=min(XX);

for i=1:length(XX)
    XX(i)=(XX(i)-XXmin)/(XXmax-XXmin);
end

CCe=[C(:,3)];
CCemax=max(CCe);
CCemin=min(CCe);

for i=1:length(CCe)
    CCe(i)=(CCe(i)-CCemin)/(CCemax-CCemin);
end

CCs=[C(:,1)];
CCsmax=max(CCs);
CCsmin=min(CCs);

for i=1:length(CCs)
    CCs(i)=(CCs(i)-CCsmin)/(CCsmax-CCsmin);
end

outtputs=[XX, CCe, CCs];
X_actual=0; E_actual=0; S_actual=0;
global X_actual E_actual S_actual;
X_actual=outtputs(:,1);
E_actual=outtputs(:,2);
S_actual=outtputs(:,3);
