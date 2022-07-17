hold off;
clear;
r=1;
c=[0 0];
pos=[c-r, r*2 r*2];
circle(0, 0, 0.5, "r")
hold on
fract(0, 0, 1, 1);
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
length=r+r_local;
    for angle=0:pi/3:pi*2          
        circle(x+r*cos(angle),y+r*sin(angle),r_local, color);
        hold on
        fract(x+length*cos(angle)*1.5, y+length*sin(angle)*1.5,r_local, col)
    end
end

function F = circle(x, y, r, color)
pgon2 = nsidedpoly(6,'Center',[x y],'Radius',r);
plot(pgon2, "linewidth", 2);
end