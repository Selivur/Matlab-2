a = 36;
b = 3;
c = 20;

 
Xo = [ 1 1 1 ];

f = @(t,x) [a*(x(2)-x(1))
 -x(1)*x(3)+c*x(2)
 x(1)*x(2)- b*x(3)];


[t,x] = ode23(f,[-150 150],[1 1 1]);

figure( 1 )
h1=plot3(x(:,1),x(:,2),x(:,3)); 
grid on
hold off
set(h1,'LineWidth',2);

[t,x] = ode45(f,[-150 150],[1 1 1]);
figure( 2 )
h1=plot3(x(:,1),x(:,2),x(:,3)); 
grid on
hold off
set(h1,'LineWidth',2);