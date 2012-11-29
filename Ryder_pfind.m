function[p,val]=Ryder_pfind(p,options);
global index param Fdata;

param=p;
%parameters here are what Jay has as C()

load batchdata.dat;

%Fills data from experiment
Td=batchdata(:,1); Fd=batchdata(:,2); Yd=batchdata(:,3);

%gets time span data for Tspan
Fdata=Fd(index);
%What is "index?"
Tstart=Td(index);
Tend=Td(index)+1;

Tspan=[Tstart Tend];

%Solves dif eq
y0=Yd(index,:);
%C_MAb is the function for production
[T Y]=ODE45(@C_MAb,Tspan,y0);

%Compared Y and Yd for fit
i=length(t);
val=0;
for j=1:6;
    dz=(Yd(j)-Y(i,j))^2;
    val=val+dz;
end

val=1/sqrt(val); %?

%tests parameters to determine if they are below zero. if they are below
%zero it replaces them with 0, since the parameters themselves cannot be 0.
%Set up so that u_max = param(1), etc.

flag=0;
for i = 1:length(param);
    if param<0;
        flag=1;
    end
end

if flag==1;
    param=0;
end

