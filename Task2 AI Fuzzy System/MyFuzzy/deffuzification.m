function [result] = deffuzification (NKList, outModel)
    
   [row col] = size(NKList);
   yDeffuz = zeros(row,1);
   
   pole = [outModel.ya , outModel.tidak];
   for i=1:row
     yDeffuz(i,1) = (pole * NKList(i,:)') / sum(NKList(i,:)); 
   end

   result = yDeffuz;
end