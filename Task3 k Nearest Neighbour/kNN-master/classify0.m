%--------------------------------------------------------------------------
%description:kNN classify0 function
%input:inX测试集，dataSet训练集，labels训练集标签，k为选择前k个近邻
%output:labels测试集标签
%date:20171114
%author:guankaer
%--------------------------------------------------------------------------
function label = classify0(inX, dataSet,labels,k)
[dataSetRow,dataSetCol] = size(dataSet);
diffMat = zeros(dataSetRow,dataSetCol);
for i = 1:dataSetRow
    for j = 1:dataSetCol
        diffMat(i,j) = (dataSet(i,j)-inX(1,j))^2;  %求差再平方
    end
end
dist = sqrt(sum(diffMat,2));  %求欧式距离
[sX,index] = sort(dist);  %排序并保留原来的序号
for i=1:k
    klabels(i) = labels(index(i));
end
sortedClass = tabulate(klabels');
label = sortedClass{1};
