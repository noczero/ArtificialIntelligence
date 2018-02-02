dataset     = xlsread ('dataEdit.xlsx');
dataTrain   = [];

for i=1:length(dataset)
   dataTrain = [ dataTrain; dataset(i,1) dataset(i,2) sugeno(hoaxRule(defuzzy(dataset(i,1),dataset(i,2)))) dataset(i,3) ]; 
end

% perfomance
performanceTrain = 0;
performanceTotal = 0;
performanceTest  = 0;
for i=1:30
    if dataTrain(i,3) == dataset(i,3)
        performanceTotal = performanceTotal+1;
        if i < 21
            performanceTrain = performanceTrain+1;
        end
        if i > 20 
            performanceTest = performanceTest+1;
        end            
    end
end
performanceTotal = performanceTotal/30;
performanceTrain = performanceTrain/20;
performanceTest  = performanceTest /10;

