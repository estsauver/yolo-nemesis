function [ G ] = setupF2( A, baseValue,vectorLength )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global A G F
    G=zeros(vectorLength,1);

if A==1
    for i=1:vectorLength
        if i<vectorLength/2
            G(i)=baseValue*rand();
        else
            G(i)=baseValue;
        end
    end
end
if A==2
    for i=1:vectorLength
        if mod(i,2)==0
            G(i)=baseValue*1.15*rand();
        else
            G(i)=baseValue*rand();
        end
    end
end
G;

end

