flag = 1;
i = 1;  
j = 1;
trial=zeros(5);
while(flag==1)
    try
        x = trial(i,j);
        i = i+1;
    catch
        flag = 0;
    end
end
i = i - 1
flag=1;
while(flag==1)    
    try
        x = trial(i,j); 
        j = j+1;       
    catch
        flag = 0;      
    end
end
j = j - 1 