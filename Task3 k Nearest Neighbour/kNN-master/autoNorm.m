%--------------------------------------------------------------------------
%description:kNN autoNorm function
%input:
%output:
%date:20171115
%author:guankaer
%--------------------------------------------------------------------------
function  [normDataSet,range,minVals] = autoNorm(dataSet)
for i =1:size(dataSet,2)
    minVals(i) = min(dataSet(:,i));
    maxVals(i) = max(dataSet(:,i));
    range(i) = maxVals(i) - minVals(i);
    normDataSet(1:length(dataSet),i) = minVals(i);
    normDataSet(:,i) = (dataSet(:,i) - normDataSet(:,i))/range(i);
end
