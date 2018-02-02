%% main
% all of data
% where first coloumn is emotional, and second coloumn is provocation
dataGiven = [
    97	74;
    36	85;
    63	43;
    82	90;
    71	25;
    79	81;
    55	62;
    57	45;
    40	65;
    57	45;
    77	70;
    68	75;
    60	70;
    82	90;
    40	85;
    80	68;
    60	72;
    50	95;
    100	18;
    11	99;
];

dataTest = [
    58	63;
    68	70;
    64	66;
    57	77;
    77	55;
    98	64;
    91	59;
    50	95;
    95	55;
    27	79;
];

dataAll = [
    97	74;
    36	85;
    63	43;
    82	90;
    71	25;
    79	81;
    55	62;
    57	45;
    40	65;
    57	45;
    77	70;
    68	75;
    60	70;
    82	90;
    40	85;
    80	68;
    60	72;
    50	95;
    100	18;
    11	99;
    58	63;
    68	70;
    64	66;
    57	77;
    77	55;
    98	64;
    91	59;
    50	95;
    95	55;
    27	79;
];

%createModel
[emotionalModel, provocationalModel, hoaxModel, rulesModel] = modelFunction();

%fuzzyfication
% data given
% [resFFEmotional, resFFProvocation] = fuzzification(emotionalModel,provocationalModel,dataGiven(:,1),dataGiven(:,2));
% data test only, uncomment it to run
 [resFFEmotional, resFFProvocation] = fuzzification(emotionalModel,provocationalModel,dataTest(:,1),dataTest(:,2));

% all of Data, uncomment it to run
% [resFFEmotional, resFFProvocation] = fuzzification(emotionalModel,provocationalModel,dataAll(:,1),dataAll(:,2));


%inference
[resInference ] = inference(resFFEmotional, resFFProvocation, rulesModel);

%defuzz
[resDefuzz]= deffuzification(resInference, hoaxModel);

%result processing
idxYaHoax = resDefuzz > 50; 
idxTidakHoax = resDefuzz < 50;

listBeritaHoax = find(idxYaHoax==1);
listBeritaTidakHoax = find(idxTidakHoax==1);
disp('List Berita Hoax ' );
disp(listBeritaHoax');
disp('List Berita Tidak Hoax ' );
disp(listBeritaTidakHoax');



