function result = kFoldCrossValidation(dataSet , labelClass, kFoldSize, kforKNN)
    % this function is to do the fold cross validation, in aims to get the
    % optimal k to use in kNN, the idea is  divide into training and validation
    % and calculate accuracy on every fold
    % k for fold is 5
    % Input
    % dataSet : all of data training,
    % return the result , first coloumn is k and the second is accuracy

    % debug
    % dataSet = dataTraining;
    % labelClass = labelClass;
    % kFoldSize = 10;
    % kforKNN = 100;
    
    [ row , ~ ] = size(dataSet);
    numberDataSingleFold = row/kFoldSize; 

    dataTesting{kFoldSize,1} = [];
    dataTraining{kFoldSize,1} = [];
    
    %divide dataTraining and dataTesting to given kFold
    dataTesting{1} = dataSet(1:numberDataSingleFold,:);
    dataTraining{1} = dataSet(numberDataSingleFold+1:end,:);
    
    % result for this loop is data testing is 400 and data training is 1600
    % if kfold : 10
    % on every single row
    for f = 2:kFoldSize
      dataTesting{f} = dataSet((f-1)*numberDataSingleFold+1:(f)*numberDataSingleFold,:);
      dataTraining{f} = [dataSet(1:(f-1)*numberDataSingleFold,:); dataSet(f*numberDataSingleFold+1:end, :)];
    end
    
    % calculate performance on every k
    kIterate = kforKNN;
    totalAvgAccuracy = zeros([kIterate/2,2]); % there is 50 list of k
    k = 1;
    inc = 1;
    while ( k < kIterate)
        accuracyList = zeros([kFoldSize,1]);
        
        for i=1:kFoldSize
           predictLabel = hoaxClassify(dataTesting{i},dataTraining{i},labelClass,k); 
           actualLabels = dataTesting{i};
           actualLabel = actualLabels(:,5);
           accuracyList(i,1) = calculateAccuracy(actualLabel,predictLabel);
        end
        totalAvgAccuracy(inc,1) = k; %record k
        totalAvgAccuracy(inc,2) = mean(accuracyList); % save the average accuracy
        k = k + 2;
        inc = inc + 1;
    end
    
    result = totalAvgAccuracy;
  
end


