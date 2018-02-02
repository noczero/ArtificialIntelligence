function [result] = inference(resultFF1, resultFF2, rules)
    %% this function is to search intersection for rules on every lingustic variable
    % and find the aggregation
    % resultFF1 is the result of fuzzyfication on emotional model
    % resultFF2 is the result of fuzzyfication on provocational model
    % return the final NK or Nilai Keputusan
    
    %%debug
    %resultFF1 = resFFEmotional;
    %resultFF2 = resFFProvocation;
    %rules = rulesModel;
    
    % flip the matrix in order to use find function for getting index non
    % zero
    % now the row is become column and the coloumn become row
    flipFF1 = resultFF1';
    flipFF2 = resultFF2';
    
    idxNonZeroFF1 = [];
    idxNonZeroFF2 = [];
    % this looping is to get the index of every non zero value and its
    % position
    for j=1:length(resultFF1) 
        %FF1
        idxeachCol = find(flipFF1(:,j));  %find idx non zero on each row
        [~,~,v] = find(flipFF1(:,j)); %get value
        idxNonZeroFF1 = [idxNonZeroFF1 ; {idxeachCol v}  ];
        
        %FF2
        idxeachCol = find(flipFF2(:,j));  %find idx non zero on each row
        [~,~,v] = find(flipFF2(:,j)); %get value
        idxNonZeroFF2 = [idxNonZeroFF2 ; {idxeachCol v} ];
    end
   
    % try anotrher method
    NKList = zeros(30,2);
    for i=1:length(resultFF1)
 
        extractValueFF1 = [idxNonZeroFF1{i,2}];
        extractValueFF2 = [idxNonZeroFF2{i,2}];

        extractPositionFF1 = [idxNonZeroFF1{i,1}];
        extractPositionFF2 = [idxNonZeroFF2{i,1}];

        [numofRowVal1,  ~]= size(extractValueFF1);
        [numofRowVal2,  ~]= size(extractValueFF2);

        andInference = [];
        listPost = [];
        NKRules = [];
        % check the every probabilites provocation one or two or more lingustic and emotion one or two or more lingustic
        if(numofRowVal1 == 1 && numofRowVal2 == 2)
            % list of inference
            andInference = [andInference; extractValueFF1(1),extractValueFF2(1)];%row1
            andInference = [andInference; extractValueFF1(1),extractValueFF2(2)];%row2

            % list of position in rules
            listPost = [listPost; extractPositionFF1(1),extractPositionFF2(1)];%row1
            listPost = [listPost; extractPositionFF1(1), extractPositionFF2(2)];%row2

            % point the position in rules
            NKRules = [NKRules; rules(listPost(1,2),listPost(1,1))]; %row1
            NKRules = [NKRules; rules(listPost(2,2),listPost(2,1))]; %row2

        elseif (numofRowVal1 == 2 && numofRowVal2 == 1)
             % list of inference
            andInference = [andInference; extractValueFF1(1),extractValueFF2(1)];%row1
            andInference = [andInference; extractValueFF1(2),extractValueFF2(1)];%row2

            % list of position in rules
            listPost = [listPost; extractPositionFF1(1),extractPositionFF2(1)];%row1
            listPost = [listPost; extractPositionFF1(2), extractPositionFF2(1)];%row2

            % point the position in rules
            NKRules = [NKRules; rules(listPost(1,2),listPost(1,1))]; %row1
            NKRules = [NKRules; rules(listPost(2,2),listPost(2,1))]; %row2

        elseif (numofRowVal1 == 1 && numofRowVal2 == 1)
             % list of inference
            andInference = [andInference; extractValueFF1(1),extractValueFF2(1)];%row1

            % list of position in rules
            listPost = [listPost; extractPositionFF1(1),extractPositionFF2(1)];%row1

            % point the position in rules
            NKRules = [NKRules; rules(listPost(1,2),listPost(1,1))]; %row1        
        elseif (numofRowVal1 == 2 && numofRowVal2 == 2)
              % list of inference
            andInference = [andInference; extractValueFF1(1),extractValueFF2(1)];%row1
            andInference = [andInference; extractValueFF1(1),extractValueFF2(2)];%row2
            andInference = [andInference; extractValueFF1(2),extractValueFF2(1)];%row3
            andInference = [andInference; extractValueFF1(2),extractValueFF2(2)];%row4

            % list of position in rules
            listPost = [listPost; extractPositionFF1(1),extractPositionFF2(1)];%row1
            listPost = [listPost; extractPositionFF1(1), extractPositionFF2(2)];%row2
            listPost = [listPost; extractPositionFF1(2),extractPositionFF2(1)];%row3
            listPost = [listPost; extractPositionFF1(2), extractPositionFF2(2)];%row4

            % point the position in rules
            NKRules = [NKRules; rules(listPost(1,2),listPost(1,1))]; %row1
            NKRules = [NKRules; rules(listPost(2,2),listPost(2,1))]; %row2
            NKRules = [NKRules; rules(listPost(3,2),listPost(3,1))]; %row3
            NKRules = [NKRules; rules(listPost(4,2),listPost(4,1))]; %row4
        end
        joinRes = [];
        joinRes = [andInference,NKRules]; % col1 : val1, col2 : val2 , col3 : label

        [rows cols] = size(joinRes);
        ya = zeros(4,1);
        tidak = zeros(4,1);
        % grouping and find the min
        for j = 1:rows
            if (joinRes(j,3) == 0)
                ya(j,:) =  min(joinRes(j,1:2));
            elseif (joinRes(j,3) ==1)
                tidak(j,:) =  min(joinRes(j,1:2));
            end
        end

        %find max on each label and return it
        NKya = max(ya);
        NKtidak = max(tidak);
        NKList(i,:) = [NKtidak, NKya];
    end
    result = NKList;
end