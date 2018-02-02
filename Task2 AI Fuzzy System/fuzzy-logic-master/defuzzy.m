function [ output_args ] = defuzzy( x , y)
z = [];

a1 = 10;
a2 = 15;
a3 = 20;

b1 = 95;
b2 = 97;
b3 = 100;

z = [ sigmoid(x,a1,a2,a3,1,0) max(sigmoid(x,a1,a2,a3,0,65),sigmoid(x,b1,b2,b3,1,20)) sigmoid(x,b1,b2,b3,0,100) ];

a1 = 70;
a2 = 75;
a3 = 80;

b1 = 90;
b2 = 95;
b3 = 100;

z = [z; sigmoid(y,a1,a2,a3,1,0) max(sigmoid(y,a1,a2,a3,0,90),sigmoid(y,b1,b2,b3,1,80)) sigmoid(y,b1,b2,b3,0,100) ]

output_args = z;
end

