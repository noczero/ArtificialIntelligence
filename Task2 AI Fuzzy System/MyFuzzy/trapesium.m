function result = trapesium(x , a , b , c , d , type) 
 %%this function is to calculate the value of x in the member function
 %%range with trapesium type
 % x is the value
 % a,b,c is the limit 
 result = 0;
 
 if(strcmp(type,'normal'))
     if(x > c)
         result = (d-x)/(d-c); %% down
     elseif (x < b)
         result = (x-a)/(b-a); %% up
     else 
         result = 1;
     end
 elseif (strcmp(type,'sideleft'))
     if(x > c)
         result = (d-x)/(d-c); %% down
     elseif (x >= a && x < c)
         result = 1;
     end
 elseif (strcmp(type,'sideright'))
     if (x < b)
         result = (x-a)/(b-a); %% up
     elseif(x >= b) 
         result = 1;
     end
     
 end
 
 
end