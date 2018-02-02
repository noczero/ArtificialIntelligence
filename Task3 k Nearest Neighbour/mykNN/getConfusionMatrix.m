function cfsMatrix = getConfusionMatrix( Ytrain , Ypredict)
    % this function is to create confusion matrix,
    % Y train is the actual label
    % Ypredict is the result of the training.
    % debug 
    % Ytrain = trainLabel;
    % Ypredict = predictLabel;

    listClass = unique(Ytrain);
    numberClass = length(listClass);
    
    cfsMatrix = zeros(numberClass);
    
    for i = 1 : length(Ytrain)
       cfsMatrix(Ytrain(i)+1, Ypredict(i)+1) = cfsMatrix(Ytrain(i)+1,Ypredict(i)+1) + 1 ;
    end
end