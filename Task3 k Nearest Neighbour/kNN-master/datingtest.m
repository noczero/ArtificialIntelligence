%--------------------------------------------------------------------------
%description:kNN classify0 datingSet function test
%input：
%output:
%date:20171115
%author:guankaer
%--------------------------------------------------------------------------
clc;
clear;
%导入数据并归一化数据
[returnMat,classLabelVector] = file2matric('datingTestSet2');
[returnMat,range,minVals] = autoNorm(returnMat);
%设定测试集大小
hoRatio = 0.1;
numTestVecs = length(returnMat) * hoRatio;
errorCount = 0;
%测试分类器
for i = 1 : numTestVecs
    classifierResult(i,1) = classify0(returnMat(i,:),returnMat(numTestVecs+1:length(returnMat),:),classLabelVector(numTestVecs+1:length(returnMat)),3);
%     fprintf('Output:%c,Original:%c\n',classifierResult(i,1),classLabelVector{i});
    if ~strcmp(classifierResult(i),classLabelVector(i))
        errorCount = errorCount + 1;
    end
end
errorRate = errorCount/numTestVecs;

%% 画图
figure;
for i = 1:length(classLabelVector)
    switch classLabelVector(i)
        case '1'
            scatter(returnMat(i,1),returnMat(i,2),'r.');
%             text(returnMat(i,1),returnMat(i,2),classLabelVector{i},'Color','red');
            hold on;
        case '2'
            scatter(returnMat(i,1),returnMat(i,2),'g.');
%             text(returnMat(i,1),returnMat(i,2),classLabelVector{i},'Color','green');
            hold on;
        case '3'
            scatter(returnMat(i,1),returnMat(i,2),'b.');
%             text(returnMat(i,1),returnMat(i,2),classLabelVector{i},'Color','black');
            hold on;
    end
end
for i=1:numTestVecs
    switch classifierResult(i)
       case '1'
            text(returnMat(i,1),returnMat(i,2),classLabelVector(i),'Color','red');
            hold on;
        case '2'
            text(returnMat(i,1),returnMat(i,2),classLabelVector(i),'Color','green');
            hold on;
        case '3'
            text(returnMat(i,1),returnMat(i,2),classLabelVector(i),'Color','black');
            hold on; 
    end
end
axis([-0.1 1.1 -0.1 1.1]);
