function [t,y] = ivps(f,t0,y0,h,tf,metodo)
 %solucionador de problemas con valor inicial
 % y' = f(t,y)   y(0)=y0
 
    switch metodo
        case 'euler'
            solver = @euler; 
            
        case 'midpoint'
            solver = @midpoint;
            
        case 'trapezoide'
            solver = @trapezoide; 
            
        otherwise
            error('Método desconocido');
    end
    
    t= t0:h:tf;
    n = length(t);
    y= zeros(length(y0),n);
    
    y(:,1)= y0;
    for i=1:1:n-1
        y(:,i+1) = y(:,i) + solver(f,t(i),y(:,i),h)*h; 
    end

end

function phi= euler(f,t,y,~)
    phi = f(t,y);
end

function phi= midpoint(f,t,y,h)
    s1=f(t,y);
    ym= y + s1*(h/2);
    phi=f(t+h/2,ym);
end

function phi= trapezoide(f,t,y,h)
        s1=f(t,y);
        yf=y+h*s1;
        s2=f(t+h,yf);
        phi =(s1+s2)/2;     
end

