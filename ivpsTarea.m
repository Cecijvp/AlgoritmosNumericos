function [t,y] = ivps(f,t0,yz0,h,tf,metodo)
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
            error('M�todo desconocido');
    end
    
    t= t0:h:tf;
    n = length(t);
    y= zeros(length(yz0),n);
    
    y(:,1)= yz0(1);
    z(:,1)= yz0(2);
    for i=1:1:n-1
        y(:,i+1) = y(:,i) + solver(f,t(i),y(:,i),h)*h; 
        z(:,i+1) = z(:,i) + solver(f,t(i),z(:,i),h)*h; 
    end

end

function phi= euler(f,t,y,z,~)
    phi = f(t,y,z);
end

function phi= midpoint(f,t,y,z,h)
    s1=f(t,y,z);
    ym= y+ z + s1*(h/2);
    phi=f(t+h/2,ym,z);
end

function phi= trapezoide(f,t,y,z,h)
        s1=f(t,y,z);
        yf=y+h*s1;
        s2=f(t+h,yf);
        phi =(s1+s2)/2;     
end

