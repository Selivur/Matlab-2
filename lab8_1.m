clear
clc
close all

%---------------------------------------------------%
% First define length of fractals and the angle
length = 20;angle = 45;
[line] = Y_fractal(5,length,angle);
% plot the results
figure(1)
for i = 1:size(line,1)
plot(line(i,1:2),line(i,3:4), 'k');
hold on
end
function [ line,root] = generate_Y( seed,dist,ang )
%--------------------------------------------------------------------
% generate -Y from intial point
% Inputs:
% seed - the starting point of each fractal
% dist - the distance between the start and end points of a line
% ang  - the angle between the three lines of each Y in a fractal
% Outputs:
% line - connection between the previous and the next
% root - the end point of each Y in a fractal
    
    N      = 1;         % N    - the order for which we need fractals
    x(N)   = seed(1);
    y(N)   = seed(2);
    x(N+1) = seed(1);
    y(N+1) = seed(2)  - dist;
    x(N+2) = x(N+1)+dist*cos(ang);
    y(N+2) = y(N+1)-dist*sin(ang);
    x(N+3) = x(N+1)-dist*cos(ang);
    y(N+3) = y(N+1)-dist*sin(ang);
    root(1,:)   = [x(N+2),y(N+2)];
    root(2,:)   = [x(N+3),y(N+3)];
    line(1,:) = [x(N),x(N+1),y(N),y(N+1)];
    line(2,:) = [x(N+1),x(N+2),y(N+1),y(N+2)];
    line(3,:) = [x(N+1),x(N+3),y(N+1),y(N+3)];
    
end
%---------------------------------------------------------------------
function [line] = Y_fractal(Norder,length,angle)
%---------------------------------------------------------------------
% Inputs:
% Norder - the order for which Y-fractal need to be generated
% length - defines the length of each line
% angle - defines the angle at which two lines of each Y in a fractal 
% should be plotted.
% Outputs:
% line - First two columns are previous node, second two are next node
%        for plotting purpose.
% Norder< 1 --- display warning
if(Norder<1)
    disp('This order does not exist')
end
% Initially it is assumed that origin i.e x and y coordinates are [0,0]
root = [0;0]; 
[line1,root1] = generate_Y(root,length,angle);
% For order = 1
if(Norder==1)
    line=line1;
end
% For higher order
if(Norder>1)
    line = line1;
    root_f = [];
for order = 1:Norder
 for j= 1:size(root1,1)
   [line2,root] =generate_Y(root1(j,:),20,45);
    root_f = [root_f;root];
    line = [line;line2];
 end
  root1 = root_f;    
end
end
end