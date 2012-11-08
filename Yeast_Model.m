function dCdt = Yeast_Model(t,C)

dCdt=zeros(6,1);
Cs=C(1); V=C(2); Ce=C(3); X=C(4); Co=C(5); Cc=C(6);

%parameters
m=0.00321; kla=600; Ke=0.0008; Yce=0.68; Kl=0.0001; Yoe=1028; 
Ks=0.002; Ycs=2.35; Qemax=0.70805; Qsmax=0.06; Yes=1.9; Qomax=0.2; Yos=2.17; 
mucr=0.15753; Cos=2.41*10^-4; Yxe=2.0; Ccs=0.00001; Yxso=4.57063; Ycso=2.35;
klac=470.4; Yxsr=0.1; Ko=3*10^-6; Ycsr=1.89;
S0=400; 
%kinetic parameters
Qs=Qsmax*Cs/(Ks+Cs);
Qolim=Qomax*Co/(Ko+Co);
Qslim=mucr/Ycs;

F=1;

Qsox=min([Qs,Qslim,1/Yos*Qolim]);
Qsr=Qs-Qsox;
Qeup=Qemax*Ce/(Ke+Ce)*Ke/(Ce+Ke);
Qeox=min([Qeup, (Qolim-Qsox*Yos)*1/Yoe]);
Qep=Yes*Qsr;
mu=Yxso*Qsox+Yxsr*Qsr+Yxe*Qeox;
Qc=Ycso*Qsox+Ycsr*Qsr+Yce*Qeox;
Qo=Yos*Qsox+Yoe*Qeox;

dCdt(1)=F/V*(S0-Cs)-(mu/Yxso+Qep/Yes+m)*X;
dCdt(2)=F;
dCdt(3)=-F/V*Ce+(Qep-Qeox)*X;
dCdt(4)=-F/V*X+mu*X;
dCdt(5)=-F/V*Co-Qo*X+kla*(Cos-Co);
dCdt(6)=-F/V*Cc+Qc*X+klac*(Ccs-Cc);




end

