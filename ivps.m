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
            
        case 'rk4'
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

function phi= rk4(f,t,y,h)
% Runge-Kutta method
% [a, b] intervalo de la función 
%y0 condición inicial 
% n = número de subintervalos 
%f = función dependiente de y ,t
h = (b-a)/n;
halfh = h/2;
y(1,:)= y0;
t(1)= a;
h6 = h/6;
for i = 1 : n
    t(i+1) = t(i) + h;
    th2 = t(i) + halfh;
    s1 = f(t(i), y(i,:));
    s2 = f(th2, y(i,:) + halfh * s1);
    s3 = f(th2, y(i,:) + halfh * s2);
    s4 = f(t(i+1), y(i,:) + h * s3);
    y(i+1,:) = y(i,:) + (s1 + s2+s2 + s3+s3 + s4) * h6;
end
end
