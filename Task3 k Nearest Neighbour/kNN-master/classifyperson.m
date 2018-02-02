%--------------------------------------------------------------------------
%description:kNN classify0 person
%input£º
%output:
%date:20171116
%author:guankaer
%-------------------------------------------------------------------------
clc;
clear;
percenTats = input('Percentage of time spent playing video games?');
ffMiles = input('Frequent flier milesearned per year?');
iceCream = input('Liters of ice cream consumed per year?');
[returnMat,classLabelVector] = file2matric('datingTestSet2');
[returnMat,range,minVals] = autoNorm(returnMat);
inArr = [ffMiles,iceCream,percenTats];
for i =1:size(inArr,2)
    inArr(i) = (inArr(i)-minVals(i))/range(i);
end
classifierResult = classify0(inArr,returnMat,classLabelVector,3);

%% »­Í¼
figure;
for i = 1:length(classLabelVector)
    switch classLabelVector(i)
        case '1'
            scatter(returnMat(i,1),returnMat(i,2),'r.');
            hold on;
        case '2'
            scatter(returnMat(i,1),returnMat(i,2),'g.');
            hold on;
        case '3'
            scatter(returnMat(i,1),returnMat(i,2),'b.');
            hold on;
    end
end
scatter(inArr(1,1),inArr(1,2),'*');
axis([-0.1 1.1 -0.1 1.1]);