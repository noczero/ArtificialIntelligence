function result = triangle(x , a , b , c) 
 %%this function is to calculate the value of x in the member function
 %%range with triangle type
 % x is the value
 % a,b,c is the limit 
 
 if(x > b)
     result = (c-x)/(c-b); %% down
 else
     result = (x-a)/(b-a); %% up
 end
 
 
end