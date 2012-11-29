function [ normedData ] = normalizedData( data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
maxData = max(data);
minData = min(data);
normedData=zeros(length(data));
for i = 1:length(data);
    normedData(i)=(data(i)-minData)/(maxData-minData);
end
end

