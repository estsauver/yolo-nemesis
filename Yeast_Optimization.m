%Program to solve the ODE's related to the yeast fermentation model
Cs0=0.0001;
V0=50000;
Ce0=0;
Co0=2.4*10^-4;
Cc0=0;
X0=0.54;

C0=[Cs0, V0, Ce0, X0, Co0, Cc0];

[t, C]=ode45('Yeast_Model',[0 15],C0);
