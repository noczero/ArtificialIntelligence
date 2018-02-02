function [ output_args ] = sugeno( x )
a1 = 10;
a2 = 24;
a3 = 45;

y = (a1 * x(1) + a2 * x(2) + a3 *x(3))/ (a1 + a2 + a3);

z = 0;
if y > 0.45
    z = 1;
else
    z = 0;
end
   
output_args = [z y x'];
end

