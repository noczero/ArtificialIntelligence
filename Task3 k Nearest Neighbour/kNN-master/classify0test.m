%--------------------------------------------------------------------------
%description:kNN function test
%input：inX测试集，dataSet训练集，labels训练集标签，k为选择前k个近邻
%output:labels测试集标签
%date:20171114
%author:guankaer
%--------------------------------------------------------------------------
clc;
clear;
%原始数据：
group = [0.9,0;1,0.1;0,1.1;0.2,1];
inX = [1,0.2];
labels = ['A';'A';'B';'B'];
%分类
label = classify0(inX,group,labels,3);
%绘图
figure;
%scatter(group(:,1),group(:,2));
for i = 1:length(group)
    if labels(i) == 'A'
        scatter(group(i,1),group(i,2),'ro');
        hold on;
    elseif labels(i) == 'B'
        scatter(group(i,1),group(i,2),'b.');
        hold on;
    end
    text(group(i,1)+0.02,group(i,2),labels(i));
end
scatter(inX(1,1),inX(1,2),'g');
text(inX(1,1)+0.02,inX(1,2),label);
axis([-0.2 1.2 -0.2 1.2]);