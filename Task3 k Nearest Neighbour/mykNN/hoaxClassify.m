function hoaxResult = hoaxClassify(dataTest, dataTrain, labels, k) 
    % this function is to return the result label of data test
    % dataTest : collection of testing data
    % dataTrain : collection of training data
    % label : label class of training data
    % k : the value of dominating data (neighbor compare)
    % return hoaxResult in list
    
    [row,~] = size(dataTest);
    hoaxResult = zeros([row,1]);
    for i=1:row
        hoaxResult(i) = kNNClassify(dataTest(i,:),dataTrain,labels,k);
    end

end