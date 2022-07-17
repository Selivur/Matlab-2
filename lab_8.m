hold off;
clear;
c=[0 0];
pos=[[-1 -1], 2 2];
% rectangle('Position',pos,'Facecolor','y','Curvature',[1 1])
circle(0, 0, 1, "y")
hold on
fract(0, 0, 1, 1);
%functions
function F = fract(x, y, r, col)
if(r<0.1)
    return
end
switch col
    case 1
        color='r';
    case 2
        color='g';
    case 3
        color='b';    
        col=0;
end
col=col+1;
r_local=r/2;
length=r_local;
    for angle=0:pi/3:pi*2  
%         pos_local=[x+length*cos(angle)-r_local,y+length*sin(angle)-r_local, r, r];
%         rectangle('Position',pos_local,'Facecolor',color,'Curvature',[1 1])
        circle(x+length*cos(angle),y+length*sin(angle),r_local, color);
        hold on
        fract(x+length*cos(angle), y+length*sin(angle),r_local, col)
    end
end
function F = circle(x, y, r, color)
i=1;
for angle=0:pi/40:pi*2
    X(i)=x+r*cos(angle);
    Y(i)=y+r*sin(angle);
    i=i+1;
end
plot(X,Y, "linewidth", 2, "color", color);
end