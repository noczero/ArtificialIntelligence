%--------------------------------------------------------------------------
%description:kNN classify0 handwriting test
%input：
%output:
%date:20171116
%author:guankaer
%--------------------------------------------------------------------------
clc;
clear;
%导入训练集数据及训练集标签
trainingDataFolder = 'D:\matlab workspace\MachineLearning\kNN\digits\trainingDigits';
trainingDataFiles = dir([trainingDataFolder '\*.txt']);
for i = 1:length(trainingDataFiles)
    name{i,1} = trainingDataFiles(i).name;
    trainingLabels(i,1) = name{i,1}(1);
    [a1] = textread(strcat(trainingDataFolder,'\',name{i,1}),'%s');
    for j = 1:length(a1)
        for k = 1:length(a1)
            trainingData(i,32*(j-1)+k) = a1{j}(k);
        end
    end
end
%导入测试集数据及测试集标签
testDataFolder = 'D:\matlab workspace\MachineLearning\kNN\digits\testDigits';
testDataFiles = dir([testDataFolder '\*.txt']);
for i = 1:length(testDataFiles)
    name{i,1} = testDataFiles(i).name;
    testLabels(i,1) = name{i,1}(1);
    [a2] = textread(strcat(testDataFolder,'\',name{i,1}),'%s');
    for j = 1:length(a2)
        for k = 1:length(a2)
            testData(i,32*(j-1)+k) = a2{j}(k);
        end
    end
end
%测试分类器
errorCount = 0;
for i = 1 : length(testLabels)
    classifierResult(i,1) = classify0(testData(i,:),trainingData,trainingLabels,3);
%     fprintf('Output:%c,Original:%c\n',classifierResult(i,1),testLabels(i));
    if ~strcmp(classifierResult(i),testLabels(i))
        errorCount = errorCount + 1;
    end
end
errorRate = errorCount/length(testLabels);




















