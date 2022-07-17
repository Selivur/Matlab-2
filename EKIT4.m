%   Salary SL  Product Sales
 
clear;
 
Price = 10000;
dP    =   100;
Zp0 = 0;
Zs0 = 0;
Zplproduct = Zp0:dP:Price;
Zplsales   = Zs0:dP:Price;
LZp = length(Zplproduct);
LZs = length(Zplsales);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_Disp    = 1;
f_Tutor   = 1;
f_Student = 1;
 
f_Plot1 = 1;
f_Plot2 = 1;
f_Pause = 1;
 
 
Prime = primes(100000);
Shift = 50;

myVar = 24; % Your variant !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Nipz = 3040;
switch Nipz
    case  31 ;  DiapazonNvar =  1: 40 ;
    case  32 ;  DiapazonNvar = 41: 80 ;
    case  41 ;  DiapazonNvar = 81:100 ;
    case 3040;  DiapazonNvar =  1:100 ;
    case   0 ;  Nvar0        = 107;
                DiapazonNvar =  Nvar0:Nvar0 ; % for Test
end
disp( ['++++++++++++++++++++++++++++++ Group IPZ-' ...
        int2str( Nipz) ] )
 
for Nvar=DiapazonNvar
    if Nvar==myVar
        KRvaria = Price* 0.4;        % may be Zero too
        aRp= 1; Rps= 500; TRp= 1000;  % SL Product from Salary
        aRs= 1; Rss= 500; TRs= 1000;    % SL Sales   from Salary

        Simple = Prime( Nvar*(1:10) );
        coefKRvaria =  0.1 + 0.1*rem( Simple( 1 ),  4 );
        Rps         =  100 + 100*rem( Simple( 3 ), 13 );
        TRp         =  100 + 100*rem( Simple( 4 ), 12 );
        Rss         =  100 + 100*rem( Simple( 7 ), 13 );
        TRs         =  100 + 100*rem( Simple( 8 ), 12 );

        KRvaria = Price* coefKRvaria;        % may be Zero too


        Qproduct = @(R) aRp./(1+exp(-2*(R-Rps)/TRp));
        Qsale    = @(R) aRs./(1+exp(-2*(R-Rss)/TRs));
        Qresult  = @(R1,R2) Qproduct(R1).*Qsale(R2);

        for is= 1:LZp
                zs = Zs0 + dP*(is-1);
            for ip= 1:LZs
                zp = Zp0 + dP*(ip-1);
                Zp(is,ip)= zp;
                Zs(is,ip)= zs;
                Pr(is,ip)= (Price-KRvaria)*Qresult(zp,zs)-zp-zs; % Profit Total
            end
        end

        [ Prmax,Ismax ] = max(Pr,[],1);
        [ Prmax,ipmax ] = max(Prmax);
        ismax = Ismax(ipmax);
        zsmax = Zs0 + dP*(ismax-1);
        zpmax = Zp0 + dP*(ipmax-1);
        prmax = Pr( ismax,ipmax );


        disp( ['-------------------------------- Nvar=( ' ...
               int2str( Nvar ) ' )' ] )
        if f_Disp
            if f_Student   
                disp( ['coefKRvaria= ' num2str( coefKRvaria ) ] )
                disp( ['Rps TRp  Rss TRs = ' num2str( [ Rps,TRp, Rss,TRs  ] ) ] )
            end

            if f_Tutor
                disp( ['SalaryProduct  SalarySale=  ' int2str( [ zpmax,zsmax ] ) ...
                                      ' ;   Profit= ' num2str( [ prmax  ]      ) ] )
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if f_Plot1
            figure(1)
            plot( Zplproduct,Qproduct(Zplproduct),'b+-'); hold on 
            plot( Zplsales,  Qsale   (Zplsales),  'm+-'); hold on 
            plot( Zplproduct,Price*Qproduct(Zplproduct),'b+-'); hold on 
            plot( Zplsales,  Price*Qsale   (Zplsales),  'm+-'); hold on 
            plot( Zplproduct,Pr(ismax,:),'r+-'); hold on 
            plot( Zplsales  ,Pr(:,ipmax),'rv-'); hold on 
            grid on
            hold off
            title('Графік залежностей');
            %title( int2str( Nvar ) );
            legend('SLprod','SLsale','PrProd','PrSale')
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if f_Plot2
            figure(2)
            surf(Zs,Zp,Pr)
            xlabel( 'SalesMan Salary' );
            ylabel( 'ProductMan Salary' );
            title('3D зображення залежності прибутку');
        end

        if f_Pause        
            pause(0.1);
        end
    end
end
disp("sdadsadd")
disp(num2str(prmax))