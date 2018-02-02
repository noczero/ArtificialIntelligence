function label = kNNClassify( dataTest, dataTrain, labels, k )
    % this function is to search the nearest neighbour for the testing data to
    % all training data and return its label.
    % Input Parameter
    % dataTest : one data for testing
    % dataTrain : all of data train which distance is calculate soon
    % label : the name of label on every data train. 1 label 1 data train.
    % k : the value of dominating data
    % return the label

    % debug :
    % dataTrain = dataTraining(1:10,:);
    % dataTest = dataTraining(10,:);
    % labels = labelClass(1:10,:);
    % k = 3;

    % create matrix for output hoax : yes or not
    labelOutput = [ 0 ; 1];

    [row,cols] = size(dataTrain);
    col = cols - 1; % until 4 coloumn cause 5 is label
    diffMat = zeros(row,col);
    for i = 1:row
        for j = 1:col
            diffMat(i,j) = (dataTrain(i,j)-dataTest(1,j))^2; % power the difference of every single coloumn of dataTrain and all dataTest on same coloumn. 
        end
    end
    dist = sqrt(sum(diffMat,2));  % to calculate euclidean distance, sum total of every coloumn on identical row and then square on every row 

    [~,index] = sort(dist); % sorting the distance in ascending, and return row index 

    for i=1:k
        klabels(i) = labels(index(i)); % give them label to its row according number of k
    end

    sortedClass = tabulate(klabels'); % search dominating class using tabulate to get frequncy
    [~,i] = max(sortedClass(:,2));  % get index of most dominating class, 1 for class 0, 2 for class 1
    label = labelOutput(i); % fit to output
end

