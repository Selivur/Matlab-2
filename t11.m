a=1;
b=1;
c=1;
d=1;

f = @(t,x) [ x(1)*(a-b)*x(2)
    -x(2)*c-d*x(1)];
        
[t,x2] = ode23(f,[-150 150],[1 1]);
plot(x2(:,1),x2(:,2)); 
hold on;
[t,x3] = ode45(f,[-150 150],[1 1]);

plot(x3(:,1),x3(:,2)); 

grid on
hold off