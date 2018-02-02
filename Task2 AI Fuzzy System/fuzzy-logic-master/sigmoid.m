function [ output_args ] = sigmoid( x , a , b , c , jenis, max)
result = 0;
if(jenis == 0)
    %     /
    %    /
    %   /
    if (x >= c & x < max)
        result = 1;
    elseif ((x >= a) & (x < b))
        result =     2*((x-a)/(c-a)) * ((x-a)/(c-a));
    elseif ((x >= b) & (x < c))
        result = 1 - 2*((c-x)/(c-a)) * ((c-x)/(c-a));
    end
elseif (jenis == 1)
    %   \
    %    \
    %     \
    if (x <= a & x > max)
        result = 1;
    elseif ((x > a) & (x < b))
        result = 1 - 2*((x-a)/(c-a)) * ((x-a)/(c-a));
    elseif ((x >= b) & (x <= c))
        result =     2*((c-x)/(c-a)) * ((c-x)/(c-a));
    end
end
output_args = result;
end

