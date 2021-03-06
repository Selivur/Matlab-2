clear;
a = 2.4;    
b =-3.78;            
c = 14;
d=-11;
e=4;
F=5.58;
p=-1;

f = @(t,x) [ a*x(2)+b*x(1)+c*x(2)*x(3)
             d*x(2)-x(3)+e*x(1)*x(3)
             F*x(3)+p*x(1)*x(2)];
        
[t,x2] = ode23(f,[-150 150],[1 1 1]);
plot3(x2(:,1),x2(:,2),x2(:,3)); 
hold on;
[t,x3] = ode45(f,[-150 150],[1 1 1]);

plot3(x3(:,1),x3(:,2),x3(:,3)); 

grid on
hold off