function [ output_args ] = hoaxRule( x )
result= [];
result = [result ; max(x(1,1),x(2,1))]; % L L = L 
result = [result ; max(x(1,1),x(2,2))]; % L M = L 
result = [result ; max(x(1,1),x(2,3))]; % L H = M

result = [result ; max(x(1,2),x(2,1))]; % M L = L 
result = [result ; max(x(1,2),x(2,2))]; % M M = M 
result = [result ; max(x(1,2),x(2,3))]; % M H = H

result = [result ; max(x(1,3),x(2,1))]; % H L = M
result = [result ; max(x(1,3),x(2,2))]; % H M = H
result = [result ; max(x(1,3),x(2,3))]; % H H = H

a = 0;
b = 0;
c = 0;

if(result(1) ~= 0 & result(2) ~= 0  & result(4) ~= 0)
    a = min(min(result(1),result(2)),result(4));
elseif (result(1) ~= 0 & result(2) ~= 0)
    a = max(min(result(1),result(2)),result(4));
elseif (result(4) ~= 0)
    a = min(max(result(1),result(2)),result(4));
end

if(result(3) ~= 0 & result(5) & result(7) ~= 0)
    b = min(min(result(3),result(5)),result(7));
elseif (result(3) ~= 0 & result(5)) 
    b = max(min(result(3),result(5)),result(7));
elseif (result(7) ~= 0)
    b = min(max(result(3),result(5)),result(7));
end

if(result(6) ~= 0 & result(8) ~= 0 & result(9) ~= 0 )
    c = max(min(result(6),result(8)),result(9));
elseif(result(6) ~= 0 & result(8) ~= 0 )
    c = max(min(result(6),result(8)),result(9)); 
elseif(result(9) ~= 0 )
    c = max(max(result(6),result(8)),result(9));    
end

result = [ a % Low
           b % medium
           c % high
           ];

output_args = result;
end

