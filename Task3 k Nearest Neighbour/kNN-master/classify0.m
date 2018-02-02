%--------------------------------------------------------------------------
%description:kNN classify0 function
%input:inX���Լ���dataSetѵ������labelsѵ������ǩ��kΪѡ��ǰk������
%output:labels���Լ���ǩ
%date:20171114
%author:guankaer
%--------------------------------------------------------------------------
function label = classify0(inX, dataSet,labels,k)
[dataSetRow,dataSetCol] = size(dataSet);
diffMat = zeros(dataSetRow,dataSetCol);
for i = 1:dataSetRow
    for j = 1:dataSetCol
        diffMat(i,j) = (dataSet(i,j)-inX(1,j))^2;  %�����ƽ��
    end
end
dist = sqrt(sum(diffMat,2));  %��ŷʽ����
[sX,index] = sort(dist);  %���򲢱���ԭ�������
for i=1:k
    klabels(i) = labels(index(i));
end
sortedClass = tabulate(klabels');
label = sortedClass{1};
