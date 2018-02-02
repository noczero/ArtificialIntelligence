function [result1 , result2] = fuzzification( model1 , model2, value1, value2) 
    %% this function is to do fuzzification 
    % model1 is emotional
    % model2 is provocation
    % value1 is the input value for emotional [0..100].
    % value2 is the input value for provocation [0..100].
    %debug
    %model1 = emo;
    %model2 = pro;
    %data = xlsread('data.xlsx');
    %value1 = data(:,1);
    %value2 = data(:,2);
    
    %%check model1
    maxRow = length(value1);
    labelValueMod1 = zeros(maxRow,5); %this variable is matrix each column representated lingustic value
    labelValueMod2 = zeros(maxRow,3);
    
    % calculate fuzification value on Model1
    for i=1:maxRow
        if (min(model1.veryLow) <= value1(i) && value1(i) <= max(model1.veryLow))
            labelValueMod1(i,1) = trapesium(value1(i),model1.veryLow(1,1),model1.veryLow(1,2),model1.veryLow(1,3),model1.veryLow(1,4),'sideleft');
        end
        if (min(model1.low) <= value1(i) && value1(i) <= max(model1.low))
            labelValueMod1(i,2) = triangle(value1(i),model1.low(1,1),model1.low(1,2),model1.low(1,3));
        end
        if (min(model1.normal) <= value1(i) && value1(i) <= max(model1.normal))
            labelValueMod1(i,3) = triangle(value1(i),model1.normal(1,1),model1.normal(1,2),model1.normal(1,3));
        end
        if (min(model1.high) <= value1(i) && value1(i) <= max(model1.high))
            labelValueMod1(i,4) = triangle(value1(i),model1.high(1,1),model1.high(1,2),model1.high(1,3));
        end
        if (min(model1.veryHigh) <= value1(i) && value1(i) <= max(model1.veryHigh))
            labelValueMod1(i,5) = trapesium(value1(i),model1.veryHigh(1,1),model1.veryHigh(1,2),model1.veryHigh(1,3),model1.veryHigh(1,4),'sideright');
        end
    end
    
    % calculate fuzification value on Model2
    for i=1:maxRow
        if (min(model2.biasa)<= value2(i) && value2(i) <= max(model2.biasa))
            labelValueMod2(i,1) = trapesium(value2(i),model2.biasa(1,1),model2.biasa(1,2),model2.biasa(1,3),model2.biasa(1,4),'sideleft');
        end
        if (min(model2.netral)<= value2(i) && value2(i) <= max(model2.netral))
            labelValueMod2(i,2) = triangle(value2(i),model2.netral(1,1),model2.netral(1,2),model2.netral(1,3));
        end
        if (min(model2.memanas)<= value2(i) && value2(i) <= max(model2.memanas))
            labelValueMod2(i,3) = trapesium(value2(i),model2.memanas(1,1),model2.memanas(1,2),model2.memanas(1,3),model2.memanas(1,4),'sideright');
        end
    end
    
    result1 = labelValueMod1;
    result2 = labelValueMod2;
    
end