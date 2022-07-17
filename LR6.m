clear;
a = 2.4;
b = -3.78;
c = 14;
d=-11;
e=4;
F=5.58;
p=1;

X = ones(1,3);
for i=1:1:15000
 xi = X(end,:);
 dfdt = step*f(step,xi);
 dfdt = reshape(dfdt,1,3);
 Xi = X(end,:) + dfdt;
 X = [X;Xi];
end
plot3(X(:,1),X(:,2),X(:,3)); 
hold on
Xo = [ 1 1 1 ];

f = @(t,x) [ a*x(2)+b*x(1)+c*x(2)*x(3)
             d*x(2)-x(3)+e*x(1)*x(3)
             F*x(3)+p*x(1)*x(2)];

         
[t,x2] = ode23(f,[-150 150],[0 0 1]);
[t,x3] = ode45(f,[-150 150],[0 0 1]);

figure( 3 )
plot3(x3(:,1),x3(:,2),x3(:,3)); 

grid on
hold off




