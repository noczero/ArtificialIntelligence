%--------------------------------------------------------------------------
%description:kNN file2matric function 导入数据
%input:
%output:
%date:20171115
%author:guankaer
%--------------------------------------------------------------------------
function [returnMat,classLabelVector] = file2matric(filename)
dataWithLabels = importdata(strcat(filename,'.txt'));
returnMat = dataWithLabels(:,1:size(dataWithLabels,2)-1);
classLabelVector = num2str(dataWithLabels(:,size(dataWithLabels,2)));