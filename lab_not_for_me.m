hold off;
clear;
circle(0, 0, 10, "y")
hold on
fract(0, 0, 10, 1);
function F = fract(x, y, r, col)
if(r<2)
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
    for angle=0:pi/3:pi*2  
        circle(x+r*cos(angle)/2,y+r*sin(angle)/2,r_local, color);
        hold on
        fract(x+(r*cos(angle))/2, y+(r*sin(angle))/2,r_local, col)
    end
end

function F = circle(x, y, r, color)
i=1;
for angle=0:pi/20:pi*2
    X(i)=x+r*cos(angle);
    Y(i)=y+r*sin(angle);
    i=i+1;
end
plot(X,Y, "color", color);
end