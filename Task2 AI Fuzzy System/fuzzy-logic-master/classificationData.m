function [ output_args ] = classificationData( data ,target )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

result = [];
for i=1:length(data(:,1))
  if(data(i,3) == target)
      result = [result; data(i,1:2)];
end
output_args = result;
end

