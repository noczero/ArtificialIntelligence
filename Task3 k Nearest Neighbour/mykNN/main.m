%% Read DataSet from Excel
filename = 'data.xlsx';
dataTraining = xlsread(filename); 
labelClass = dataTraining(:,5); %only get the class coloumn

result = kFoldCrossValidation(dataTraining,labelClass,10,200); % do k fold cross validation

plot(result(:,1),result(:,2)) % visualize

[ val , idx ] = max(result(:,2));
bestK = result(idx,1);
text = sprintf('Result : Best k is %d and the accuracy is %f percent',bestK,val*100);
disp(text);

%% found k and then use it to predict label
dataTesting = xlsread(filename,'DataTest');
resultTesting = hoaxClassify(dataTesting,dataTraining,labelClass,bestK);

newFileName = 'resultData.xlsx';
xlswrite(newFileName,resultTesting); % create new file contains the result
