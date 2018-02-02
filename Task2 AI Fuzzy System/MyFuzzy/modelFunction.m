function [inputModel1, inputModel2, outputModel, rulesModel] = modelFunction()
%% Make Input, Output and Rules membership function
% Emotionaal
emo.veryLow     = [ 0 , 0 , 25 , 35];  %trapezium [ a, b , c , b]
emo.low         = [ 30 , 35 , 45 ];      %triangle [a ,b ,c]
emo.normal      = [ 35 , 45 , 75];      %triangle [a ,b ,c]
emo.high        = [ 60 , 70 , 88];       %triangle [a ,b ,c]
emo.veryHigh    = [ 75, 80, 100, 100 ]; %trapezium [ a, b , c , b]

% Provocation
pro.biasa     = [ 0 , 0 , 20 , 30];  %trapezium [ a, b , c , b]
pro.netral    = [ 20 , 45 , 70];      %triangle [a ,b ,c]
pro.memanas   = [ 60 , 80 , 100 , 100];%trapezium [a ,b ,c, d]

% Hoax 
% sugeno model
hoax.ya = 80;
hoax.tidak = 0;

% Rules
% 1 for ya, 0 for tidak
% Variable Emotional stand for coloumn ,each coloumn is the linguistic value
% from veryLow , low, normal, high ,very high
% Variable Provocation stand for row ,each row is the linguistic value
% from biasa , netral, memanas
rules = [
  0 0 0 0 1 ;  
  0 0 0 1 1 ;
  1 1 0 1 1 ;
];

inputModel1 = emo;
inputModel2 = pro;
outputModel = hoax;
rulesModel = rules;

% for vizualize
emotional = 0:0.01:100;
provocational = 0:0.01:100;

mf1 = trapmf(emotional,emo.veryLow);
mf2 = trimf(emotional,emo.low);
mf3 = trimf(emotional,emo.normal);
mf4 = trimf(emotional,emo.high);
mf5 = trapmf(emotional,emo.veryHigh);

mfpro1 = trapmf(provocational,pro.biasa);
mfpro2 = trimf(provocational,pro.netral);
mfpro3 = trapmf(provocational,pro.memanas);

subplot(1,2,1)
plot(emotional,mf1,'linewidth',1);
hold on 
plot(emotional,mf2,'linewidth',1);
plot(emotional,mf3,'linewidth',1);
plot(emotional,mf4,'linewidth',1);
plot(emotional,mf5,'linewidth',1);
title('Provokasi');

subplot(1,2,2)
plot(provocational,mfpro1,'linewidth',1);
hold on
plot(provocational,mfpro2,'linewidth',1);
plot(provocational,mfpro3,'linewidth',1);
title('Emosi');


end