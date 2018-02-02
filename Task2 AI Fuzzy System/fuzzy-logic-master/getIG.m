function [ output_args ] = getIG( data, es, b ,c , b3)
% c  = variable ke ..... ( baris )
p = [];


for i=1 : length(b)
   x = [];
   for j=1:length(b3)
        x = [x; 0];
   end
   for j=1 : length(data)
      if data(j,c) == b(i)
          for k=1:length(b3)
             if b3(k) == data(j,3)
                x(k) = x(k) + 1; 
             end
          end
      end
   end
   p = [p; x' sum(x')];
end

e = [];

for i=1:length(p)
   if (p(i,1)~= 0 & p(i,2) ~=0)
        e = [e; - p(i,1)/p(i,3) * log2( p(i,1)/p(i,3)) - p(i,2)/p(i,3) * log2( p(i,2)/p(i,3))];
   else
       e = [e; 0];
   end
end
e
ig = es
for i=1:length(e)
    ig = ig - (p(i,3)/length(data)) * e(i);
end

output_args = ig
end

