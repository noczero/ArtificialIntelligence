function [ output_args ] = getEntropy( data , b )

banyakOutputPerJenis = [];
for i=1:length(b)
   temp = 0;
   for j=1:length(data)
      if data(j,3) == b(i)
         temp = temp + 1;
      end
   end
   banyakOutputPerJenis = [banyakOutputPerJenis; temp];
end

entropy = 0;
for i=1:length(b)
   entropy = entropy -banyakOutputPerJenis(i)/sum(banyakOutputPerJenis) * log2(banyakOutputPerJenis(i)/sum(banyakOutputPerJenis));
end

output_args = entropy;
end

