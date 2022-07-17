%   Salary SL  Product Sales
clear
 
e1 = 0.1;
e2 = 0.2;
e3 = 0.3;
 
nT = 10;
T  = 0:(nT-1);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_Disp    = 1;
f_Tutor   = 1;
f_Student = 1;
 
f_Plot1 = 1;
f_Pause = 0;
 
 
Prime = primes(100000);
Shift = 50;
DiapazonNvar =  24 
 
for Nvar=DiapazonNvar
 
    Simple = Prime( Nvar*(1:20) );
         B=[ 99   32  168  111   66   33  203  168  125  114]
         C= [-78 -100 -130 -166 -160  -70  -52 -100 -148  -16]

         S = B + C;
    
    E1 = 1./(1+e1).^T;
    E2 = 1./(1+e2).^T;
    E3 = 1./(1+e3).^T;
    
    B1 = B.*E1;
    C1 = C.*E1;
    S1 = S.*E1;
    
    B2 = B.*E2;
    C2 = C.*E2;
    S2 = S.*E2;
    
    B3 = B.*E3;
    C3 = C.*E3;
    S3 = S.*E3;
    
    SS (1) = S (1);   
    SS1(1) = S1(1);   
    SS2(1) = S2(1);   
    SS3(1) = S3(1);   
    
 for i=2:nT   
    
    SS (i)=SS (i-1)+S (i);
    SS1(i)=SS1(i-1)+S1(i);
    SS2(i)=SS2(i-1)+S2(i);
    SS3(i)=SS3(i-1)+S3(i);
 
 end
        
        
disp( ['-------------------------------- Nvar=( ' ...
       int2str( Nvar ) ' )' ] )
if f_Disp
if f_Student   
disp( ['B= ' int2str( B ) ] )
disp( ['C= ' int2str( C ) ] )
end
 
if f_Tutor
disp( ['S = ' int2str( S  ) ] )
disp( ['SS = ' int2str( SS  ) ] )
disp( ['SS1= ' int2str( SS1 ) ] )
disp( ['SS2= ' int2str( SS2 ) ] )
disp( ['SS3= ' int2str( SS3 ) ] )
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if f_Plot1
figure( 1 )
plot( T,SS, 'g+-' ); hold on 
plot( T,SS1,'b+:' ); hold on 
plot( T,SS2,'k+-.'); hold on 
plot( T,SS3,'m+--'); hold on 
grid on
hold off
title( [ 'Nvar= ' int2str( Nvar ) ] );
legend('SS','SS1','SS2','SS3')
end
 
 
if f_Pause  ;      
    pause(0.1) ;
end
 
 
 
end
