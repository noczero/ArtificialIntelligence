function result = calculateAccuracy( realLabel , predictLabel)
    % this function is to calculate accuracy based on the number of right
    % answer divide all of the testing. but i use the confusion matrix for
    % it
    % return result of accuracy
   
    cfsMatrix = getConfusionMatrix(realLabel,predictLabel);
    result = calculatePerformance(cfsMatrix,3);
    
end